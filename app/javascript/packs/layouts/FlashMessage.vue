<template>
  <div @click="$page.props.flash.message = {}">
    <div v-if="$page.props.flash.message.alert" class="alert alert-danger">
      {{ $page.props.flash.message.alert }}
    </div>

    <div v-if="$page.props.flash.message.notice" class="alert alert-info">
      {{ $page.props.flash.message.notice }}
    </div>
  </div>
</template>

<style scoped>
.alert {
  padding: 15px;
  margin-bottom: 20px;
  border: 1px solid transparent;
  border-radius: 4px;
}
.alert-info {
  color: #31708f;
  background-color: #d9edf7;
  border-color: #bce8f1;
}
.alert-danger {
  color: #a94442;
  background-color: #f2dede;
  border-color: #ebccd1;
}
</style>
