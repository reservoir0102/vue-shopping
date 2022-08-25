export default {
    password (value) {
        if (!value) return '请输入密码'
        if (!/^\w{6,24}$/.test(value)) return '密码是6-24个字符'
        return true
      },
    mobile (value) {
        if (!value) return '请输入手机号'
        if (!/^1[3-9]\d{9}$/.test(value)) return '手机号格式错误'
        return true
      },
    code (value) {
        if (!value) return '请输入验证码'
        if (!/^\d{6}$/.test(value)) return '验证码是6个数字'
        return true
    }
}