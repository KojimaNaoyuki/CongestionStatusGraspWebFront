<template>
  <section class="congestion">
    <h2 class="congestion-name">会議室B</h2>
    <div class="congestion-contents">
      <div class="congestion-contents-img-wrap">
        <img
          src="~/assets/img/humanLv1.svg"
          class="congestion-contents-img-contents"
          v-if="this.$route.query.humanLv == 1"
        />
        <img
          src="~/assets/img/humanLv2.svg"
          class="congestion-contents-img-contents"
          v-if="this.$route.query.humanLv == 2"
        />
        <img
          src="~/assets/img/humanLv3.svg"
          class="congestion-contents-img-contents"
          v-if="this.$route.query.humanLv == 3"
        />
      </div>

      <!-- =========================================================== -->

      <h2
        class="congestion-contents-congestion-ms"
        style="color: #618a30"
        v-if="this.$route.query.humanLv == 1"
      >
        空いてる
      </h2>

      <h3
        class="congestion-contents-congestion-degree"
        style="color: #618a30"
        v-if="this.$route.query.humanLv == 1"
      >
        1m^2あたり1.666人
      </h3>

      <!-- =========================================================== -->

      <h2
        class="congestion-contents-congestion-ms"
        style="color: #f09814"
        v-if="this.$route.query.humanLv == 2"
      >
        普通
      </h2>

      <h3
        class="congestion-contents-congestion-degree"
        style="color: #f09814"
        v-if="this.$route.query.humanLv == 2"
      >
        1m^2あたり1.666人
      </h3>

      <!-- =========================================================== -->

      <h2
        class="congestion-contents-congestion-ms"
        style="color: rgb(225, 72, 5)"
        v-if="this.$route.query.humanLv == 3"
      >
        混雑
      </h2>

      <h3
        class="congestion-contents-congestion-degree"
        style="color: rgb(225, 72, 5)"
        v-if="this.$route.query.humanLv == 3"
      >
        1m^2あたり1.666人
      </h3>

      <!-- =========================================================== -->
    </div>
  </section>
</template>

<script>
export default {
  mounted: function () {
    if (this.$route.query.humanLv == 1)
      document.querySelector(".congestion").style.backgroundColor = "#e4ffdf";

    if (this.$route.query.humanLv == 2)
      document.querySelector(".congestion").style.backgroundColor = "#ffdfca";

    if (this.$route.query.humanLv == 3)
      document.querySelector(".congestion").style.backgroundColor = "#ffc7c7";
  },
};
</script>

<style lang="scss" scoped>
.congestion {
  position: relative;
  width: 100vw;
  height: 100vh;

  &-name {
    padding: 5px 10px;
    font-size: 18px;
    font-weight: bold;
  }

  &-contents {
    position: absolute;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);

    &-img {
      &-wrap {
        text-align: center;
      }
      &-contents {
        width: 124px;
      }
    }

    &-congestion {
      &-ms {
        padding: 20px 0 30px;
        font-size: 30px;
        font-weight: bold;
        text-align: center;
      }
      &-degree {
        width: 90vw;
        text-align: center;
        font-size: 20px;
        font-weight: bold;
        color: #000;
      }
    }
  }
}
</style>
