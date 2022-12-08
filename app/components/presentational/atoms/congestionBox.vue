<template>
  <div class="congestionBox" @click="gotoPage">
    <img
      src="~/assets/img/humanLv1.svg"
      class="congestionBox-img"
      v-if="humanLv == 1"
    />
    <img
      src="~/assets/img/humanLv2.svg"
      class="congestionBox-img"
      v-if="humanLv == 2"
    />
    <img
      src="~/assets/img/humanLv3.svg"
      class="congestionBox-img"
      v-if="humanLv == 3"
    />
    <div class="congestionBox-title-wrap">
      <h3 class="congestionBox-title-ms">{{ placeName }}</h3>
    </div>
  </div>
</template>

<script>
import axios from "axios";

export default {
  props: ["placeName", "placeId"],

  data() {
    return {
      humanLv: 1,
    };
  },

  mounted: async function () {
    try {
      const response = await axios.get(
        "http://localhost:3001/v1/congestion_data/" + this.placeId
      );

      const density = response.data.data[0].density;

      this.calcHumanLv(density);
    } catch (err) {
      console.log(err);
    }
  },

  methods: {
    gotoPage: async function () {
      window.location =
        "/congestion/" + this.placeId + "?" + "humanLv=" + this.humanLv;
    },

    calcHumanLv: function (density) {
      if (density > 3) {
        this.humanLv = 3;
        return;
      }
      if (density > 2) {
        this.humanLv = 2;
        return;
      }
      if (density > 1) {
        this.humanLv = 1;
        return;
      }
    },
  },
};
</script>

<style lang="scss" scoped>
.congestionBox {
  display: flex;
  align-items: center;
  padding: 5px 5px;
  box-shadow: 0px 0px 4px 1px #c5c5c5;
  &-img {
    width: 64px;
  }

  &-title {
    &-wrap {
      flex: 1;
      display: flex;
      justify-content: center;
    }
    &-ms {
      padding: 0 20px;
      font-size: 18px;
      font-weight: bold;
      color: #2e2e2e;
      transform: translateX(-25%);
    }
  }
}
</style>
