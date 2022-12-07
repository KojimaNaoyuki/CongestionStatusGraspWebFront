<template>
  <div>
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
</template>

<script>
import axios from "axios";
import CongestionBox from "~/components/presentational/atoms/congestionBox";

export default {
  components: {
    CongestionBox,
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
.congestion-box {
  margin: 0px 0 10px;
}
</style>
