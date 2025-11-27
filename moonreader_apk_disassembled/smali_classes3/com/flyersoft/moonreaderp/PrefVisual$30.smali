.class Lcom/flyersoft/moonreaderp/PrefVisual$30;
.super Ljava/lang/Object;
.source "PrefVisual.java"

# interfaces
.implements Lcom/flyersoft/moonreaderp/PrefFontPick$OnGetFont;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/PrefVisual;->onClick(Landroid/view/View;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/moonreaderp/PrefVisual;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/PrefVisual;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 1011
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefVisual$30;->this$0:Lcom/flyersoft/moonreaderp/PrefVisual;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public getFont(Ljava/lang/String;Z)V
    .locals 3

    if-eqz p1, :cond_3

    .line 1013
    sget-object v0, Lcom/flyersoft/tools/A;->fontName:Ljava/lang/String;

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_3

    .line 1014
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v1, Lcom/flyersoft/staticlayout/MyHtml;->familyBold:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object v1, Lcom/flyersoft/staticlayout/MyHtml;->familyItalic:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object v1, Lcom/flyersoft/staticlayout/MyHtml;->familyBoldItalic:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 1015
    sput-object p1, Lcom/flyersoft/tools/A;->fontName:Ljava/lang/String;

    .line 1016
    invoke-static {}, Lcom/flyersoft/staticlayout/MyHtml;->initFamilyFontParams()V

    .line 1017
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v2, Lcom/flyersoft/staticlayout/MyHtml;->familyBold:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object v2, Lcom/flyersoft/staticlayout/MyHtml;->familyItalic:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object v2, Lcom/flyersoft/staticlayout/MyHtml;->familyBoldItalic:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 1018
    iget-object v2, p0, Lcom/flyersoft/moonreaderp/PrefVisual$30;->this$0:Lcom/flyersoft/moonreaderp/PrefVisual;

    invoke-static {v2}, Lcom/flyersoft/moonreaderp/PrefVisual;->-$$Nest$mrefreshFontStyle(Lcom/flyersoft/moonreaderp/PrefVisual;)V

    if-nez p2, :cond_1

    .line 1020
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-nez p2, :cond_0

    goto :goto_0

    .line 1024
    :cond_0
    iget-object p2, p0, Lcom/flyersoft/moonreaderp/PrefVisual$30;->this$0:Lcom/flyersoft/moonreaderp/PrefVisual;

    invoke-static {p2}, Lcom/flyersoft/moonreaderp/PrefVisual;->-$$Nest$meraseGPUShadow(Lcom/flyersoft/moonreaderp/PrefVisual;)V

    goto :goto_1

    .line 1021
    :cond_1
    :goto_0
    iget-object p2, p0, Lcom/flyersoft/moonreaderp/PrefVisual$30;->this$0:Lcom/flyersoft/moonreaderp/PrefVisual;

    invoke-static {p2}, Lcom/flyersoft/moonreaderp/PrefVisual;->-$$Nest$mrefreshTxtRender(Lcom/flyersoft/moonreaderp/PrefVisual;)V

    .line 1022
    iget-object p2, p0, Lcom/flyersoft/moonreaderp/PrefVisual$30;->this$0:Lcom/flyersoft/moonreaderp/PrefVisual;

    invoke-static {p2}, Lcom/flyersoft/moonreaderp/PrefVisual;->-$$Nest$meraseGPUShadow(Lcom/flyersoft/moonreaderp/PrefVisual;)V

    .line 1026
    :goto_1
    sget-object p2, Lcom/flyersoft/tools/A;->txtView:Lcom/flyersoft/staticlayout/MRTextView;

    if-eqz p2, :cond_4

    const-string p2, "Calluna.ttf"

    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_4

    .line 1027
    sget-boolean p1, Lcom/flyersoft/tools/A;->isChinese:Z

    if-eqz p1, :cond_4

    .line 1029
    sget-boolean p1, Lcom/flyersoft/tools/A;->isChinesePRC:Z

    const-string p2, "\u8bf7\u6ce8\u610f, \u8be5\u5b57\u4f53\u4e0d\u9002\u5408\u7528\u4e8e\u4e2d\u6587\u9605\u8bfb, \u4f1a\u5f15\u8d77\u9996\u884c\u6587\u5b57\u5c55\u793a\u4e0d\u5168\u7684\u95ee\u9898."

    if-nez p1, :cond_2

    .line 1030
    invoke-static {p2}, Lcom/flyersoft/tools/miscellaneous/ChineseJianFanConvert;->convertJian2Fan(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    .line 1031
    :cond_2
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefVisual$30;->this$0:Lcom/flyersoft/moonreaderp/PrefVisual;

    invoke-virtual {p1}, Lcom/flyersoft/moonreaderp/PrefVisual;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-static {p2}, Lcom/flyersoft/tools/A;->chineseJianFanConvert(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    invoke-static {p1, p2}, Lcom/flyersoft/tools/T;->showAlertText(Landroid/content/Context;Ljava/lang/CharSequence;)V

    goto :goto_2

    :cond_3
    if-eqz p2, :cond_4

    .line 1034
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefVisual$30;->this$0:Lcom/flyersoft/moonreaderp/PrefVisual;

    invoke-static {p1}, Lcom/flyersoft/moonreaderp/PrefVisual;->-$$Nest$mrefreshFontStyle(Lcom/flyersoft/moonreaderp/PrefVisual;)V

    .line 1035
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefVisual$30;->this$0:Lcom/flyersoft/moonreaderp/PrefVisual;

    invoke-static {p1}, Lcom/flyersoft/moonreaderp/PrefVisual;->-$$Nest$mrefreshTxtRender(Lcom/flyersoft/moonreaderp/PrefVisual;)V

    .line 1037
    :cond_4
    :goto_2
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefVisual$30;->this$0:Lcom/flyersoft/moonreaderp/PrefVisual;

    invoke-static {p1}, Lcom/flyersoft/moonreaderp/PrefVisual;->-$$Nest$mshowUsedFontName(Lcom/flyersoft/moonreaderp/PrefVisual;)V

    return-void
.end method
