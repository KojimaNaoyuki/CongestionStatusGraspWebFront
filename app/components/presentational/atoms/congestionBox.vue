<template>
  <div class="congestionBox">
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
      <h3 class="congestionBox-title-ms">会議室B</h3>
    </div>
  </div>
</template>

<script>
export default {
  props: ["humanLv"],
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
