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

      <!-- <h2
        class="congestion-contents-congestion-ms"
        style="color: #8bbe4e"
        v-if="this.$route.query.humanLv == 1"
      >
        空いてる
      </h2> -->

      <h2
        class="congestion-contents-congestion-humanNum"
        style="color: #8bbe4e"
        v-if="this.$route.query.humanLv == 1"
      >
        16人
      </h2>

      <h3
        class="congestion-contents-congestion-degree"
        style="color: #8bbe4e"
        v-if="this.$route.query.humanLv == 1"
      >
        1m<sup>2</sup>あたり1.666人
      </h3>

      <!-- =========================================================== -->

      <!-- <h2
        class="congestion-contents-congestion-ms"
        style="color: #f09814"
        v-if="this.$route.query.humanLv == 2"
      >
        普通
      </h2> -->

      <h2
        class="congestion-contents-congestion-humanNum"
        style="color: #f09814"
        v-if="this.$route.query.humanLv == 2"
      >
        16人
      </h2>

      <h3
        class="congestion-contents-congestion-degree"
        style="color: #f09814"
        v-if="this.$route.query.humanLv == 2"
      >
        1m<sup>2</sup>あたり1.666人
      </h3>

      <!-- =========================================================== -->

      <!-- <h2
        class="congestion-contents-congestion-ms"
        style="color: rgb(225, 72, 5)"
        v-if="this.$route.query.humanLv == 3"
      >
        混雑
      </h2> -->

      <h2
        class="congestion-contents-congestion-humanNum"
        style="color: rgb(225, 72, 5)"
        v-if="this.$route.query.humanLv == 3"
      >
        16人
      </h2>

      <h3
        class="congestion-contents-congestion-degree"
        style="color: rgb(225, 72, 5)"
        v-if="this.$route.query.humanLv == 3"
      >
        1m<sup>2</sup>あたり1.666人
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
    display: inline-block;
    text-align: left;
    padding: 5px 50px;
    font-size: 24px;
    font-weight: bold;
    color: #fff;
    background-color: #797dff;
    border-radius: 0 0 30px 0;
  }

  &-contents {
    position: absolute;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
    max-width: 900px;
    margin: 0 auto;

    &-img {
      &-wrap {
        text-align: center;
      }
      &-contents {
        width: 40%;
        max-width: 260px;
      }
    }

    &-congestion {
      &-humanNum {
        padding: 20px 0 30px;
        font-size: min(10vw, 60px);
        font-weight: bold;
        text-align: center;
      }
      &-ms {
        position: absolute;
        top: -50px;
        left: 0;
        font-size: 60px;
        font-weight: bold;
        text-align: center;
        transform: rotate(-30deg);
        opacity: 0.5;
      }
      &-degree {
        width: 90vw;
        max-width: 900px;
        text-align: center;
        font-size: min(7vw, 40px);
        font-weight: bold;
        color: #000;
      }
    }
  }
}
</style>
