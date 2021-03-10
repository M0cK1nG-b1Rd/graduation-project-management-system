<template>
  <div>
    <a-button type="primary" @click="showDrawer"> <a-icon type="plus" /> New account </a-button>
    <a-drawer
      title="Create a new account"
      :width="720"
      :visible="visible"
      :body-style="{ paddingBottom: '80px' }"
      @close="onClose"
    >
    </a-drawer>
  </div>
</template>
<script>
export default {
  name: 'Test',
  data() {
    return {
      form: this.$form.createForm(this),
      visible: false
    }
  },
  methods: {
    showDrawer() {
      this.visible = true
    },
    onClose() {
      this.visible = false
    }
  }
}
</script>
