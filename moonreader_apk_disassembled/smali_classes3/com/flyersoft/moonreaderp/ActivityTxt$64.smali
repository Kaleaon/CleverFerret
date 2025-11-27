.class Lcom/flyersoft/moonreaderp/ActivityTxt$64;
.super Ljava/lang/Object;
.source "ActivityTxt.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/ActivityTxt;->showTxtByPosition(JLjava/lang/String;)V
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

    .line 6228
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$64;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 5

    .line 6231
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$64;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->txtView:Lcom/flyersoft/staticlayout/MRTextView;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$64;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->txtView:Lcom/flyersoft/staticlayout/MRTextView;

    invoke-virtual {v0}, Lcom/flyersoft/staticlayout/MRTextView;->getLayout()Lcom/flyersoft/staticlayout/MyLayout;

    move-result-object v0

    if-nez v0, :cond_0

    goto :goto_0

    .line 6233
    :cond_0
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$64;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->txtView:Lcom/flyersoft/staticlayout/MRTextView;

    invoke-virtual {v0}, Lcom/flyersoft/staticlayout/MRTextView;->getLayout()Lcom/flyersoft/staticlayout/MyLayout;

    move-result-object v0

    iget-object v1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$64;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object v1, v1, Lcom/flyersoft/moonreaderp/ActivityTxt;->txtView:Lcom/flyersoft/staticlayout/MRTextView;

    invoke-virtual {v1}, Lcom/flyersoft/staticlayout/MRTextView;->getLayout()Lcom/flyersoft/staticlayout/MyLayout;

    move-result-object v1

    iget-object v2, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$64;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object v2, v2, Lcom/flyersoft/moonreaderp/ActivityTxt;->txtScroll:Lcom/flyersoft/views/ScrollView2;

    invoke-virtual {v2}, Lcom/flyersoft/views/ScrollView2;->getScrollY()I

    move-result v2

    invoke-virtual {v1, v2}, Lcom/flyersoft/staticlayout/MyLayout;->getLineForVertical(I)I

    move-result v1

    invoke-virtual {v0, v1}, Lcom/flyersoft/staticlayout/MyLayout;->getLineStart(I)I

    move-result v0

    int-to-long v0, v0

    .line 6234
    invoke-static {v0, v1}, Lcom/flyersoft/tools/A;->getTxtRealPos(J)J

    move-result-wide v0

    .line 6235
    sget-wide v2, Lcom/flyersoft/tools/A;->lastPosition:J

    cmp-long v4, v0, v2

    if-eqz v4, :cond_1

    .line 6236
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$64;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    sget-wide v1, Lcom/flyersoft/tools/A;->lastPosition:J

    const/4 v3, 0x0

    invoke-virtual {v0, v1, v2, v3}, Lcom/flyersoft/moonreaderp/ActivityTxt;->showTxtByPosition(JLjava/lang/String;)V

    :cond_1
    :goto_0
    return-void
.end method
