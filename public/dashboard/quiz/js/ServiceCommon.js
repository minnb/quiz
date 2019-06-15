//=-----------------------service common giải quyết các việc nhỏ chung chung--------------------
function ServiceCommon() {
}
ServiceCommon.prototype.isArray = function (value) {
    if (Array.isArray(value)) {
        if (value.length) {
            return true;
        }
    }
    return false;
}
