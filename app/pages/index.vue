<template>
  <div>
    <div class="congestion-box">
      <CongestionBox :humanLv="1" />
    </div>
    <div class="congestion-box">
      <CongestionBox :humanLv="2" />
    </div>
    <div class="congestion-box">
      <CongestionBox :humanLv="3" />
    </div>
  </div>
</template>

<script>
import CongestionBox from "~/components/presentational/atoms/congestionBox";

export default {
  components: {
    CongestionBox,
  },
};
</script>

<style lang="scss" scoped>
.congestion-box {
  margin: 0px 0 10px;
}
</style>
