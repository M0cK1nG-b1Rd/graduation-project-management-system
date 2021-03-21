<template>
  <div>
    <v-chart :forceFit="true" :height="height" :data="data" :scale="scale" :padding="20">
      <v-tooltip/>
      <v-interval
        shape="liquid-fill-gauge"
        position="gender*value"
        color="gender"
        :v-style="style1"
      />
      <v-guide
        v-for="(row, index) in data"
        :key="index"
        type="text"
        :top="true"
        :position="{
            gender: row.gender,
            value: 50
        }"
        :content="'超过了'+row.value + '%的人'"
        :v-style="style2"
      />
    </v-chart>
  </div>
</template>
<script>
const scale = [{
  dataKey: 'value',
  min: 0,
  max: 100
}]
export default {
  name: 'MyScore',
  data() {
    return {
      data: [{
        gender: 'male',
        value: 80
      }],
      scale,
      style1: {
        lineWidth: 10,
        opacity: 0.75
      },
      style2: {
        fontSize: 20,
        textAlign: 'center'
      },
      height: 200
    }
  }
}
</script>
