<template>
<div>
  <!--    面包屑导航区域-->
  <el-breadcrumb separator-class="el-icon-arrow-right">
    <el-breadcrumb-item :to="{ path: '/welcome' }">首页</el-breadcrumb-item>
    <el-breadcrumb-item>成绩管理</el-breadcrumb-item>
    <el-breadcrumb-item>我的成绩</el-breadcrumb-item>
  </el-breadcrumb>
<!--  成绩查看整体卡片-->
  <el-card>
<!--  折叠面板-->
  <el-collapse v-model="activeNames" @change="handleChange">
    <el-collapse-item title="开题成绩" name="1">
      <el-row>
        <el-col>
          <el-card class="box-card">
            <el-row>
              <!--            成绩列表-->
              <el-col :span="15">
                <div v-for="o in 4" :key="o" class="text item">
                  {{'列表内容 ' + o }}
                </div>
              </el-col>
              <!--            统计列表-->
              <el-col :span="9">
                <el-card>
                  <div v-for="o in 4" :key="o" class="text item">
                    {{'列表内容 ' + o }}
                  </div>
                </el-card>
              </el-col>
            </el-row>
          </el-card>
        </el-col>
      </el-row>
    </el-collapse-item>
    <el-collapse-item title="中期成绩" name="2">
      <el-row>
        <el-col>
          <el-card class="box-card">
            <el-row>
            <!--            成绩列表-->
              <el-col :span="15">
                <div v-for="o in 4" :key="o" class="text item">
                  {{'列表内容 ' + o }}
                </div>
              </el-col>
            <!--            统计列表-->
              <el-col :span="9">
                <el-card>
                <div v-for="o in 4" :key="o" class="text item">
                  {{'列表内容 ' + o }}
                </div>
                </el-card>
              </el-col>
            </el-row>
          </el-card>
        </el-col>
      </el-row>
    </el-collapse-item>
    <el-collapse-item title="结题成绩" name="3">
      <el-row>
        <el-col>
          <el-card class="box-card">
            <el-row>
              <!--            成绩列表-->
              <el-col :span="15">
                <div v-for="o in 4" :key="o" class="text item">
                  {{'列表内容 ' + o }}
                </div>
              </el-col>
              <!--            统计列表-->
              <el-col :span="9">
                <el-card>
                  <div v-for="o in 4" :key="o" class="text item">
                    {{'列表内容 ' + o }}
                  </div>
                </el-card>
              </el-col>
            </el-row>
          </el-card>
        </el-col>
      </el-row>
    </el-collapse-item>
    <el-collapse-item title="阶段成绩" name="4">
      <el-row>
        <el-col>
          <el-card class="box-card">
            <el-row>
              <!--            成绩列表-->
              <el-col :span="15">
                <div v-for="o in 4" :key="o" class="text item">
                  {{'列表内容 ' + o }}
                </div>
              </el-col>
              <!--            统计列表-->
              <el-col :span="9">
                <el-card>
                  <div v-for="o in 4" :key="o" class="text item">
                    {{'列表内容 ' + o }}
                  </div>
                </el-card>
              </el-col>
            </el-row>
          </el-card>
        </el-col>
      </el-row>
    </el-collapse-item>
  </el-collapse>
  </el-card>
</div>
</template>

<script>
export default {
  name: 'MyScore'
}
</script>

<style scoped>

</style>
