/**
 * Created by kai.wang on 12/14/13.
 */

function addToTd(content,cls){
    var html;
    var tdStart = '';
    var tdEnd = '</td>';
    if(typeof(cls)!='undefined' && cls.length > 0){
        tdStart = '<td class="'+cls+'">';
    }else{
        tdStart = '<td>';
    }
    html = tdStart+content+tdEnd;
    return html;
}

function addToTr(tds,cls){
    var html;
    var trStart = '';
    var trEnd = '</tr>';
    if(typeof(cls)!='undefined' && cls.length > 0){
        trStart = '<tr class="'+cls+'">';
    }else{
        trStart = '<tr>';
    }
    html = trStart+tds+trEnd;
    return html;
}

function intToPostStatus(status){
    if(status === 0){
        return '未审核';
    }else if(status === 1){
        return '正常显示';
    }else if(status === 9){
        return '已删除';
    }else{
        return '其他';
    }
}

function intToPostStatusSpan(status){
    if(status === 0){
        return '<span class="label label-info">未审核</span>';
    }else if(status === 1){
        return '<span class="label label-success">正常显示</span>';
    }else if(status === 9){
        return '<span class="label label-danger">已删除</span>';
    }else{
        return '<span class="label label-default">其他</span>';
    }
}


/**
 * 组装图片控件
 * @param url
 * @param alt
 * @param cls
 * @returns {string}
 */
function addToImg(url,alt,cls){
    if(!url || typeof url == 'undefined' || url.length <= 0){
        return '';
    }
    var imgStart = '';
    var imgEnd = '/>';
    var src = '';
    if(typeof cls != 'undefined' && cls.length > 0){
        imgStart = '<img class="'+cls+'" ';
    }else{
        imgStart = '<img ';
    }
    if(typeof alt != 'undefined' && alt.length > 0){
        imgStart += ' alt="'+alt+'" ';
    }
    src = ' src="'+url+'" '
    return imgStart+src+imgEnd;
}

function addToA(url,alt,cls,html){
    if(!url || typeof url == 'undefined' || url.length <= 0){
        return '';
    }
    var aStart = '';
    var aEnd = '</a>';
    var href = '';
    if(typeof cls != 'undefined' && cls.length > 0){
        aStart = '<a target="_blank" class="'+cls+'" ';
    }else{
        aStart = '<a target="_blank"';
    }
    if(typeof alt != 'undefined' && alt.length > 0){
        aStart += ' alt="'+alt+'" ';
    }
    href = ' href="'+url+'" '
    return aStart+href+'>'+html+aEnd;
}