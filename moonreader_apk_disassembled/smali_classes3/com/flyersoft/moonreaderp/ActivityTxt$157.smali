.class Lcom/flyersoft/moonreaderp/ActivityTxt$157;
.super Ljava/lang/Object;
.source "ActivityTxt.java"

# interfaces
.implements Landroid/view/View$OnLongClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/ActivityTxt;->initColorTemplateEvents()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/ActivityTxt;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 15776
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$157;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onLongClick(Landroid/view/View;)Z
    .locals 8

    .line 15778
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$157;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/ActivityTxt;->colorTemplate:Lcom/flyersoft/views/ColorTemplate;

    invoke-virtual {p1}, Lcom/flyersoft/views/ColorTemplate;->isClickTop()Z

    move-result p1

    const/4 v0, 0x1

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$157;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-virtual {p1}, Lcom/flyersoft/moonreaderp/ActivityTxt;->isClickOnAnnot()Z

    move-result p1

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$157;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-virtual {p1}, Lcom/flyersoft/moonreaderp/ActivityTxt;->isPdfNoflow()Z

    move-result p1

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$157;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/ActivityTxt;->pdf:Lcom/flyersoft/books/PDFReader;

    iget-boolean p1, p1, Lcom/flyersoft/books/PDFReader;->isDjvu:Z

    if-nez p1, :cond_0

    return v0

    .line 15781
    :cond_0
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$157;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/ActivityTxt;->colorTemplate:Lcom/flyersoft/views/ColorTemplate;

    invoke-virtual {p1}, Lcom/flyersoft/views/ColorTemplate;->isClickTop()Z

    move-result p1

    if-eqz p1, :cond_1

    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$157;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/ActivityTxt;->colorTemplate:Lcom/flyersoft/views/ColorTemplate;

    invoke-virtual {p1}, Lcom/flyersoft/views/ColorTemplate;->getClicked()I

    move-result p1

    const/4 v1, 0x4

    if-ne p1, v1, :cond_1

    .line 15782
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$157;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    sget v1, Lcom/flyersoft/moonreaderp/R$string;->show_highlight_template_tip:I

    invoke-virtual {p1, v1}, Lcom/flyersoft/moonreaderp/ActivityTxt;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-static {p1, v1, v0}, Lcom/flyersoft/tools/T;->showToastText(Landroid/content/Context;Ljava/lang/CharSequence;I)V

    return v0

    .line 15787
    :cond_1
    new-instance v2, Lcom/flyersoft/moonreaderp/PrefColorPick;

    iget-object v3, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$157;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    sget p1, Lcom/flyersoft/moonreaderp/R$string;->highlight_color:I

    invoke-virtual {v3, p1}, Lcom/flyersoft/moonreaderp/ActivityTxt;->getString(I)Ljava/lang/String;

    move-result-object v4

    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$157;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/ActivityTxt;->colorTemplate:Lcom/flyersoft/views/ColorTemplate;

    .line 15788
    invoke-virtual {p1}, Lcom/flyersoft/views/ColorTemplate;->getLongClickedColor()I

    move-result v6

    new-instance v7, Lcom/flyersoft/moonreaderp/ActivityTxt$157$1;

    invoke-direct {v7, p0}, Lcom/flyersoft/moonreaderp/ActivityTxt$157$1;-><init>(Lcom/flyersoft/moonreaderp/ActivityTxt$157;)V

    const/4 v5, 0x1

    invoke-direct/range {v2 .. v7}, Lcom/flyersoft/moonreaderp/PrefColorPick;-><init>(Landroid/content/Context;Ljava/lang/String;ZILcom/flyersoft/moonreaderp/PrefColorPick$OnSaveColor;)V

    .line 15832
    invoke-virtual {v2}, Lcom/flyersoft/moonreaderp/PrefColorPick;->show()V

    return v0
.end method
