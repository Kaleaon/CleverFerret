.class Lcom/flyersoft/moonreaderp/ActivityTxt$122;
.super Landroid/os/Handler;
.source "ActivityTxt.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/ActivityTxt;->doPrefSearchResult(IZ)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/ActivityTxt;Landroid/os/Looper;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010,
            0x0
        }
        names = {
            null,
            null
        }
    .end annotation

    .line 12794
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$122;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-direct {p0, p2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 3

    .line 12797
    iget-object p1, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast p1, Lcom/flyersoft/moonreaderp/PrefSearch$SearchResult;

    .line 12798
    sget-boolean v0, Lcom/radaee/pdf/Global;->textReflow:Z

    if-eqz v0, :cond_2

    .line 12799
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$122;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->txtView:Lcom/flyersoft/staticlayout/MRTextView;

    iget v1, p1, Lcom/flyersoft/moonreaderp/PrefSearch$SearchResult;->start:I

    iput v1, v0, Lcom/flyersoft/staticlayout/MRTextView;->hStart:I

    .line 12800
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$122;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->txtView:Lcom/flyersoft/staticlayout/MRTextView;

    iget v1, p1, Lcom/flyersoft/moonreaderp/PrefSearch$SearchResult;->end:I

    iput v1, v0, Lcom/flyersoft/staticlayout/MRTextView;->hEnd:I

    .line 12801
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$122;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->txtView:Lcom/flyersoft/staticlayout/MRTextView;

    invoke-virtual {v0}, Lcom/flyersoft/staticlayout/MRTextView;->getLayout()Lcom/flyersoft/staticlayout/MyLayout;

    move-result-object v0

    iget-object v1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$122;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object v1, v1, Lcom/flyersoft/moonreaderp/ActivityTxt;->txtView:Lcom/flyersoft/staticlayout/MRTextView;

    invoke-virtual {v1}, Lcom/flyersoft/staticlayout/MRTextView;->getLayout()Lcom/flyersoft/staticlayout/MyLayout;

    move-result-object v1

    iget-object v2, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$122;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object v2, v2, Lcom/flyersoft/moonreaderp/ActivityTxt;->txtScroll:Lcom/flyersoft/views/ScrollView2;

    invoke-virtual {v2}, Lcom/flyersoft/views/ScrollView2;->getScrollY()I

    move-result v2

    invoke-virtual {v1, v2}, Lcom/flyersoft/staticlayout/MyLayout;->getLineForVertical(I)I

    move-result v1

    invoke-virtual {v0, v1}, Lcom/flyersoft/staticlayout/MyLayout;->getLineStart(I)I

    move-result v0

    .line 12802
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$122;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {v1}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$misPage2Visible(Lcom/flyersoft/moonreaderp/ActivityTxt;)Z

    move-result v1

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$122;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object v1, v1, Lcom/flyersoft/moonreaderp/ActivityTxt;->txtScroll2:Lcom/flyersoft/views/ScrollView2;

    goto :goto_0

    :cond_0
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$122;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object v1, v1, Lcom/flyersoft/moonreaderp/ActivityTxt;->txtScroll:Lcom/flyersoft/views/ScrollView2;

    :goto_0
    const/4 v2, -0x1

    invoke-static {v1, v2}, Lcom/flyersoft/tools/A;->getLastDisplayLine(Landroid/widget/ScrollView;I)I

    move-result v1

    .line 12803
    iget-object v2, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$122;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object v2, v2, Lcom/flyersoft/moonreaderp/ActivityTxt;->txtView:Lcom/flyersoft/staticlayout/MRTextView;

    invoke-virtual {v2}, Lcom/flyersoft/staticlayout/MRTextView;->getLayout()Lcom/flyersoft/staticlayout/MyLayout;

    move-result-object v2

    invoke-virtual {v2, v1}, Lcom/flyersoft/staticlayout/MyLayout;->getLineEnd(I)I

    move-result v1

    .line 12804
    iget-object v2, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$122;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object v2, v2, Lcom/flyersoft/moonreaderp/ActivityTxt;->txtView:Lcom/flyersoft/staticlayout/MRTextView;

    iget v2, v2, Lcom/flyersoft/staticlayout/MRTextView;->hStart:I

    if-lt v2, v0, :cond_1

    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$122;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->txtView:Lcom/flyersoft/staticlayout/MRTextView;

    iget v0, v0, Lcom/flyersoft/staticlayout/MRTextView;->hEnd:I

    if-ge v0, v1, :cond_1

    .line 12805
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$122;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/ActivityTxt;->txtView:Lcom/flyersoft/staticlayout/MRTextView;

    invoke-virtual {p1}, Lcom/flyersoft/staticlayout/MRTextView;->postInvalidate()V

    return-void

    .line 12807
    :cond_1
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$122;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-wide v1, p1, Lcom/flyersoft/moonreaderp/PrefSearch$SearchResult;->position:J

    long-to-int p1, v1

    invoke-static {v0, p1}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$mtxtScrollNoDelay(Lcom/flyersoft/moonreaderp/ActivityTxt;I)V

    .line 12808
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$122;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Lcom/flyersoft/moonreaderp/ActivityTxt;->showReadProgress(I)V

    return-void

    .line 12811
    :cond_2
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$122;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget v1, p1, Lcom/flyersoft/moonreaderp/PrefSearch$SearchResult;->start:I

    iget p1, p1, Lcom/flyersoft/moonreaderp/PrefSearch$SearchResult;->end:I

    add-int/lit8 p1, p1, -0x1

    invoke-static {v0, v1, p1}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$mpdfSetForceSel(Lcom/flyersoft/moonreaderp/ActivityTxt;II)V

    return-void
.end method
