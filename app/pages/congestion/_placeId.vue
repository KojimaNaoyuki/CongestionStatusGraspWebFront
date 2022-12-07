<template>
  <section class="congestion">
    <h2 class="congestion-name" id="congestionName">未設定</h2>
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
        class="congestion-contents-congestion-humanNum"
        style="color: #8bbe4e"
        v-if="this.$route.query.humanLv == 1"
      >
        <span id="number_of_people">--</span>人
      </h2>

      <h3
        class="congestion-contents-congestion-degree"
        style="color: #8bbe4e"
        v-if="this.$route.query.humanLv == 1"
      >
        1m<sup>2</sup>あたり<span id="density">--</span>人
      </h3>

      <!-- =========================================================== -->

      <h2
        class="congestion-contents-congestion-humanNum"
        style="color: #f09814"
        v-if="this.$route.query.humanLv == 2"
      >
        <span id="number_of_people">--</span>人
      </h2>

      <h3
        class="congestion-contents-congestion-degree"
        style="color: #f09814"
        v-if="this.$route.query.humanLv == 2"
      >
        1m<sup>2</sup>あたり<span id="density">--</span>人
      </h3>

      <!-- =========================================================== -->

      <h2
        class="congestion-contents-congestion-humanNum"
        style="color: rgb(225, 72, 5)"
        v-if="this.$route.query.humanLv == 3"
      >
        <span id="number_of_people">--</span>人
      </h2>

      <h3
        class="congestion-contents-congestion-degree"
        style="color: rgb(225, 72, 5)"
        v-if="this.$route.query.humanLv == 3"
      >
        1m<sup>2</sup>あたり<span id="density">--</span>人
      </h3>

      <!-- =========================================================== -->
    </div>
  </section>
</template>

<script>
import axios from "axios";

export default {
  data() {
    return {
      placeData: null,
      congestionData: null,
    };
  },

  mounted: async function () {
    const response = await axios.get(
      "http://localhost:3001/v1/congestion_data/" + this.$route.params.placeId
    );
    this.congestionData = response.data.data[0];
    this.placeData = response.data.data[1];
    console.log(this.congestionData);
    console.log(this.placeData);

    document.querySelector("#congestionName").innerHTML = this.placeData.name;
    document.querySelector("#number_of_people").innerHTML =
      this.congestionData.number_of_people;
    document.querySelector("#density").innerHTML = this.congestionData.density;

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
