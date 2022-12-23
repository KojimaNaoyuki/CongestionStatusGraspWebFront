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
    <h3 class="congestionBox-title-ms">{{ placeName }}</h3>
  </div>
</template>

<script>
import axios from "axios";

export default {
  props: ["placeName", "placeId"],

  data() {
    return {
      humanLv: 1,
      congestionDataId: null,
    };
  },

  mounted: async function () {
    try {
      const response = await axios.get(
        "http://localhost:3001/v1/congestion_data/serach?name=" + this.placeName
      );

      this.congestionDataId = response.data.data[0].id;

      const density = response.data.data[0].density;

      this.calcHumanLv(density);
    } catch (err) {
      console.log(err);
    }
  },

  methods: {
    gotoPage: async function () {
      window.location =
        "/congestion/" +
        this.congestionDataId +
        "?" +
        "humanLv=" +
        this.humanLv;
    },

    calcHumanLv: function (density) {
      const humanLv1Density = 0.5;
      const humanLv2Density = 0.75;

      if (0 <= density && density < humanLv1Density) this.humanLv = 1;
      if (humanLv1Density <= density && density < humanLv2Density)
        this.humanLv = 2;
      if (humanLv2Density <= density) this.humanLv = 3;
    },
  },
};
</script>

<style lang="scss" scoped>
.congestionBox {
  text-align: center;
  padding: 15px 0px;
  margin: 0 10px;
  border: solid 2px #ccc;
  border-radius: 15px;
  max-width: 340px;
  width: 90vw;
  &:hover {
    transition: all 0.4s;
    background-color: #cdcfff;
    cursor: pointer;
  }

  &-img {
    width: 84px;
  }

  &-title {
    &-ms {
      padding: 0 20px;
      font-size: 22px;
      font-weight: bold;
      color: #2e2e2e;
      text-align: center;
    }
  }
}
</style>
