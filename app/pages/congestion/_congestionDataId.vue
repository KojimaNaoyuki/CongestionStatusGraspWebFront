<template>
  <section class="congestion">
    <h2 class="congestion-name" id="congestionName">計測準備中</h2>
    <div class="congestion-contents">
      <div class="congestion-contents-img-wrap">
        <img
          src="~/assets/img/humanLv1.svg"
          class="congestion-contents-img-contents"
          v-if="this.humanLv == 1"
        />
        <img
          src="~/assets/img/humanLv2.svg"
          class="congestion-contents-img-contents"
          v-if="this.humanLv == 2"
        />
        <img
          src="~/assets/img/humanLv3.svg"
          class="congestion-contents-img-contents"
          v-if="this.humanLv == 3"
        />
      </div>

      <!-- =========================================================== -->

      <h2
        class="congestion-contents-congestion-humanNum"
        style="color: #8bbe4e"
        v-if="this.humanLv == 1"
      >
        <span id="number_of_people">--</span>人
      </h2>

      <h3
        class="congestion-contents-congestion-degree"
        style="color: #8bbe4e"
        v-if="this.humanLv == 1"
      >
        1m<sup>2</sup>あたり<span id="density">--</span>人
      </h3>

      <!-- =========================================================== -->

      <h2
        class="congestion-contents-congestion-humanNum"
        style="color: #f09814"
        v-if="this.humanLv == 2"
      >
        <span id="number_of_people">--</span>人
      </h2>

      <h3
        class="congestion-contents-congestion-degree"
        style="color: #f09814"
        v-if="this.humanLv == 2"
      >
        1m<sup>2</sup>あたり<span id="density">--</span>人
      </h3>

      <!-- =========================================================== -->

      <h2
        class="congestion-contents-congestion-humanNum"
        style="color: rgb(225, 72, 5)"
        v-if="this.humanLv == 3"
      >
        <span id="number_of_people">--</span>人
      </h2>

      <h3
        class="congestion-contents-congestion-degree"
        style="color: rgb(225, 72, 5)"
        v-if="this.humanLv == 3"
      >
        1m<sup>2</sup>あたり<span id="density">--</span>人
      </h3>

      <!-- =========================================================== -->
    </div>
    <div class="congestion-contents-explanation">
      <h3>千葉工業大学 情報ネットワーク学科 中川研究室</h3>
      <h3>卒業研究「混雑情報共有システム」実験中</h3>
    </div>
    <h3 class="congestion-time" id="congestionTime">更新日時</h3>
  </section>
</template>

<script>
import axios from "axios";

export default {
  data() {
    return {
      placeData: null,
      congestionData: null,
      humanLv: this.$route.query.humanLv,
    };
  },

  methods: {
    getCongestionData: async function () {
      try {
        const response = await axios.get(
          "http://localhost:3001/v1/congestion_data/" +
            this.$route.params.congestionDataId
        );
        this.congestionData = response.data.data[0];
        this.placeData = response.data.data[1];
        console.log(this.congestionData);
        console.log(this.placeData);

        document.querySelector("#congestionName").innerHTML =
          this.placeData.name;
        document.querySelector("#number_of_people").innerHTML =
          this.congestionData.number_of_people;
        document.querySelector("#density").innerHTML =
          this.congestionData.density;

        let updateTime = new Date(this.congestionData.updated_at);
        document.querySelector(
          "#congestionTime"
        ).innerHTML = `更新: ${updateTime.toLocaleString("ja-JP")}`;

        this.calcHumanLv(this.congestionData.density);
        console.log(this.humanLv);

        if (this.humanLv == 1)
          document.querySelector(".congestion").style.backgroundColor =
            "#e4ffdf";

        if (this.humanLv == 2)
          document.querySelector(".congestion").style.backgroundColor =
            "#ffdfca";

        if (this.humanLv == 3)
          document.querySelector(".congestion").style.backgroundColor =
            "#ffc7c7";
      } catch (err) {
        console.log(err);
      }
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

  mounted: function () {
    this.getCongestionData();

    // 2分30秒毎に更新
    setInterval(() => {
      this.getCongestionData();
    }, 150000);
  },
};
</script>

<style lang="scss" scoped>
.congestion {
  position: relative;
  width: 100vw;
  height: 100vh;

  &-time {
    position: absolute;
    top: 0;
    right: 0px;
    padding: 5px 10px;
    font-size: 10px;
    font-weight: bold;
    color: #585858;
    @media screen and (min-width: 900px) {
      font-size: min(4vw, 20px);
    }
  }

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

    &-explanation {
      position: absolute;
      bottom: 0;
      left: 0;
      width: 100vw;
      & h3 {
        padding: 0 10px 5px;
        font-size: min(3vw, 20px);
        font-weight: bold;
        color: #585858;
        text-align: right;
      }
    }

    &-img {
      &-wrap {
        margin: 50px 0 0;
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
