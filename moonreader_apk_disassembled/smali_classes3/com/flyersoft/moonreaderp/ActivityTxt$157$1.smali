.class Lcom/flyersoft/moonreaderp/ActivityTxt$157$1;
.super Ljava/lang/Object;
.source "ActivityTxt.java"

# interfaces
.implements Lcom/flyersoft/moonreaderp/PrefColorPick$OnSaveColor;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/ActivityTxt$157;->onLongClick(Landroid/view/View;)Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/flyersoft/moonreaderp/ActivityTxt$157;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/ActivityTxt$157;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 15788
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$157$1;->this$1:Lcom/flyersoft/moonreaderp/ActivityTxt$157;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public getColor(I)V
    .locals 5

    .line 15790
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$157$1;->this$1:Lcom/flyersoft/moonreaderp/ActivityTxt$157;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityTxt$157;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->colorTemplate:Lcom/flyersoft/views/ColorTemplate;

    invoke-virtual {v0}, Lcom/flyersoft/views/ColorTemplate;->isClickTop()Z

    move-result v0

    const/4 v1, 0x4

    const/4 v2, 0x3

    const/4 v3, 0x2

    const/4 v4, 0x1

    if-eqz v0, :cond_6

    .line 15791
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$157$1;->this$1:Lcom/flyersoft/moonreaderp/ActivityTxt$157;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityTxt$157;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->colorTemplate:Lcom/flyersoft/views/ColorTemplate;

    invoke-virtual {v0}, Lcom/flyersoft/views/ColorTemplate;->getClicked()I

    move-result v0

    if-eqz v0, :cond_4

    if-eq v0, v4, :cond_3

    if-eq v0, v3, :cond_2

    if-eq v0, v2, :cond_1

    if-eq v0, v1, :cond_0

    goto :goto_0

    :cond_0
    return-void

    .line 15805
    :cond_1
    sput p1, Lcom/flyersoft/tools/A;->squiggly_color:I

    goto :goto_0

    .line 15802
    :cond_2
    sput p1, Lcom/flyersoft/tools/A;->strikethrough_color:I

    goto :goto_0

    .line 15799
    :cond_3
    sput p1, Lcom/flyersoft/tools/A;->underline_color:I

    goto :goto_0

    .line 15793
    :cond_4
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$157$1;->this$1:Lcom/flyersoft/moonreaderp/ActivityTxt$157;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityTxt$157;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-virtual {v0}, Lcom/flyersoft/moonreaderp/ActivityTxt;->isPdf()Z

    move-result v0

    if-eqz v0, :cond_5

    .line 15794
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$157$1;->this$1:Lcom/flyersoft/moonreaderp/ActivityTxt$157;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityTxt$157;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-virtual {v0, p1, v4}, Lcom/flyersoft/moonreaderp/ActivityTxt;->setPdfHighlightColor(IZ)V

    goto :goto_0

    .line 15796
    :cond_5
    sput p1, Lcom/flyersoft/tools/A;->highlight_color:I

    goto :goto_0

    .line 15811
    :cond_6
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$157$1;->this$1:Lcom/flyersoft/moonreaderp/ActivityTxt$157;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityTxt$157;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->colorTemplate:Lcom/flyersoft/views/ColorTemplate;

    invoke-virtual {v0}, Lcom/flyersoft/views/ColorTemplate;->getClicked()I

    move-result v0

    if-eqz v0, :cond_b

    if-eq v0, v4, :cond_a

    if-eq v0, v3, :cond_9

    if-eq v0, v2, :cond_8

    if-eq v0, v1, :cond_7

    goto :goto_0

    .line 15825
    :cond_7
    sput p1, Lcom/flyersoft/tools/A;->highlight_color5:I

    goto :goto_0

    .line 15822
    :cond_8
    sput p1, Lcom/flyersoft/tools/A;->highlight_color4:I

    goto :goto_0

    .line 15819
    :cond_9
    sput p1, Lcom/flyersoft/tools/A;->highlight_color3:I

    goto :goto_0

    .line 15816
    :cond_a
    sput p1, Lcom/flyersoft/tools/A;->highlight_color2:I

    goto :goto_0

    .line 15813
    :cond_b
    sput p1, Lcom/flyersoft/tools/A;->highlight_color1:I

    .line 15830
    :goto_0
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$157$1;->this$1:Lcom/flyersoft/moonreaderp/ActivityTxt$157;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/ActivityTxt$157;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {p1}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$mcolorTemplicateClick(Lcom/flyersoft/moonreaderp/ActivityTxt;)V

    return-void
.end method
