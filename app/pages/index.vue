<template>
  <div>
    <Header />
    <div class="wrap">
      <div
        class="congestion-box"
        v-for="placeDatum in this.placeData"
        :key="placeDatum.id"
      >
        <CongestionBox
          :humanLv="1"
          :placeName="placeDatum.name"
          :placeId="placeDatum.id"
        />
      </div>
    </div>
  </div>
</template>

<script>
import axios from "axios";
import CongestionBox from "~/components/presentational/organisms/congestionBox";
import Header from "~/components/presentational/organisms/header";

export default {
  components: {
    CongestionBox,
    Header,
  },

  data() {
    return {
      placeData: null,
    };
  },

  mounted: async function () {
    const response = await axios.get("http://localhost:3001/v1/places");
    this.placeData = response.data.data;
    console.log(this.placeData);
  },
};
</script>

<style lang="scss" scoped>
.wrap {
  padding-top: 10px;

  @media screen and (min-width: 900px) {
    display: flex;
    align-items: center;
    justify-content: center;
    flex-wrap: wrap;
    max-width: 1200px;
    margin: 0 auto;
    padding-top: 16px;
  }
}
.congestion-box {
  margin: 10px 0;
}
</style>
