<template>
  <div>
    <!--    面包屑导航区域-->
    <el-breadcrumb separator-class="el-icon-arrow-right">
      <el-breadcrumb-item :to="{ path: '/welcome' }">首页</el-breadcrumb-item>
      <el-breadcrumb-item>选题管理</el-breadcrumb-item>
      <el-breadcrumb-item>双选信息</el-breadcrumb-item>
    </el-breadcrumb>
    <el-row type="flex" justify="center">
      <el-card class="outer_detail">
<!--        搜索筛选框-->
        <el-row class="search_zone">
          <el-input placeholder="输入关键字查询相关公告"
                    v-model="queryInfo.keyWord" @change="getNotice"
                    class="input-with-select">
            <el-button slot="append" icon="el-icon-search" type="primary"></el-button>
          </el-input>
        </el-row>
        <el-divider></el-divider>
<!--        表格区域-->
        <el-row class="table_zone">
          <el-table
            border
            :highlight-current-row="true"
            :data="noticeList"
            size="medium "
            :default-sort = "{prop: 'date', order: 'descending'}"
            style="width: 100%; font-size: 15px">
            <!--          标题-->
            <el-table-column
              :show-overflow-tooltip="true"
              prop="annTitle"
              label="标题"
              width="300">
            </el-table-column>
            <!--          日期-->
            <el-table-column
              sortable
              :show-overflow-tooltip="true"
              prop="createTime"
              label="修改时间"
              width="110">
            </el-table-column>
            <!--          类型-->
            <el-table-column
              :show-overflow-tooltip="true"
              prop="type"
              label="公告类型"
              width="100"
              :filters="[{ text: '学业通知', value: 1 }, { text: '答辩安排', value: 2 }, { text: '工作安排', value: 3 }]"
              :filter-method="filterType"
              filter-placement="bottom-end">
              <template slot-scope="scope">
                <el-tag v-if="scope.row.type==1" type="info">学业通知</el-tag>
                <el-tag v-if="scope.row.type==2" type="success">答辩安排</el-tag>
                <el-tag v-if="scope.row.type==3" type="primary">工作安排</el-tag>
              </template>
            </el-table-column>
            <!--          状态-->
            <el-table-column
              :show-overflow-tooltip="true"
              prop="status"
              width="120"
              :filters="[{ text: '草稿箱', value: 1 }, { text: '已发布', value: 2 }, { text: '回收站', value: 3 }]"
              :filter-method="filterStatus"
              filter-placement="bottom-end"
              label="发布状态">
              <template slot-scope="scope">
                <el-tag type="success" v-if=" scope.row.status == 2">已发布</el-tag>
                <el-tag type="warning" v-if=" scope.row.status == 1">待发布</el-tag>
                <el-tag type="danger" v-if=" scope.row.status == 3">已撤回</el-tag>
              </template>
            </el-table-column>
            <!--          操作-->
            <el-table-column
              :show-overflow-tooltip="true"
              width="200"
              label="操作">
              <template slot-scope="scope">
                <!--              查看详细内容-->
                <el-tooltip class="item" effect="dark" content="查看详细内容" placement="top" :enterable="false">
                  <el-button type="success" icon="el-icon-view" circle size="mini" @click="viewNotice(scope.row)"></el-button>
                </el-tooltip>
                <!--              编辑通知-->
                <el-tooltip class="item" effect="dark" content="编辑通知" placement="top" :enterable="false">
                  <el-button type="primary" icon="el-icon-edit" circle size="mini" @click="editNotice(scope.row)"></el-button>
                </el-tooltip>
                <!--              删除通知-->
                <el-tooltip class="item" effect="dark" content="删除通知" placement="top" :enterable="false">
                  <el-popconfirm
                    @confirm="deleteNotice(scope.row)"
                    style="margin-left: 9px"
                    title="确定要撤回该公告吗？">
                    <el-button slot="reference" type="danger" icon="el-icon-delete" circle size="mini"></el-button>
                  </el-popconfirm>
                </el-tooltip>
              </template>
            </el-table-column>
          </el-table>
        </el-row>
<!--         分页区-->
        <el-row type="flex" style="margin-top: 20px; margin-left: 20px">
          <el-pagination
            @size-change="handleSizeChange"
            @current-change="handleCurrentChange"
            :current-page="queryInfo.page"
            :page-sizes="[5, 10, 20]"
            :page-size="100"
            layout="total, sizes, prev, pager, next, jumper"
            :total="totalPageNum">
          </el-pagination>
        </el-row>
      </el-card>
    </el-row>
  </div>
</template>

<script>
export default {
  name: 'ApplicationRecords',
  mounted() {
    // this.getApplicationRecords()
  },
  data() {
    return {
      queryInfo: {
        keyWord: '', // 关键词
        current: 1, // 当前页号
        size: 10 // 页面大小
      }
    }
  }
}
</script>

<style Lang="less" scoped>
/*最外层卡片*/
.outer_detail{
  width: 80%;
  border-radius: 4px;
  background: #ffffff;
  box-shadow:  28px 28px 56px #bababa,
    -28px -28px 56px #ffffff;
}
/*分割线*/
.el-divider{
  margin: 10px;
}
</style>
