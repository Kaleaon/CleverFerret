.class Lcom/flyersoft/moonreaderp/ActivityTxt$79;
.super Ljava/lang/Object;
.source "ActivityTxt.java"

# interfaces
.implements Lcom/flyersoft/components/MyMenu$MenuItemClick;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/ActivityTxt;->isVisualBoomarkClick(Landroid/view/MotionEvent;)Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

.field final synthetic val$bm:Lcom/flyersoft/tools/A$Bookmark;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/ActivityTxt;Lcom/flyersoft/tools/A$Bookmark;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010,
            0x1010
        }
        names = {
            null,
            null
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 7770
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$79;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iput-object p2, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$79;->val$bm:Lcom/flyersoft/tools/A$Bookmark;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(I)V
    .locals 6

    if-eqz p1, :cond_2

    const/4 v0, 0x1

    if-eq p1, v0, :cond_0

    goto :goto_0

    .line 7788
    :cond_0
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$79;->val$bm:Lcom/flyersoft/tools/A$Bookmark;

    invoke-static {p1}, Lcom/flyersoft/tools/A;->removeBookmark(Lcom/flyersoft/tools/A$Bookmark;)V

    .line 7789
    sput-boolean v0, Lcom/flyersoft/tools/A;->hasNewNoteForUpload:Z

    .line 7790
    sput-boolean v0, Lcom/flyersoft/tools/A;->lastFileAnnotUpdated:Z

    .line 7791
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$79;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {p1}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$mupdateForFitHardwareAccelerate(Lcom/flyersoft/moonreaderp/ActivityTxt;)Z

    move-result p1

    if-nez p1, :cond_1

    .line 7792
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$79;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/ActivityTxt;->contentLay:Lcom/flyersoft/views/ContentLay;

    invoke-virtual {p1}, Lcom/flyersoft/views/ContentLay;->postInvalidate()V

    :cond_1
    :goto_0
    return-void

    .line 7774
    :cond_2
    new-instance v0, Lcom/flyersoft/moonreaderp/PrefEditBookmark;

    iget-object v1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$79;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$79;->val$bm:Lcom/flyersoft/tools/A$Bookmark;

    iget-object v2, p1, Lcom/flyersoft/tools/A$Bookmark;->name:Ljava/lang/String;

    new-instance v3, Lcom/flyersoft/moonreaderp/ActivityTxt$79$1;

    invoke-direct {v3, p0}, Lcom/flyersoft/moonreaderp/ActivityTxt$79$1;-><init>(Lcom/flyersoft/moonreaderp/ActivityTxt$79;)V

    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$79;->val$bm:Lcom/flyersoft/tools/A$Bookmark;

    iget p1, p1, Lcom/flyersoft/tools/A$Bookmark;->color:I

    .line 7784
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$79;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-virtual {p1}, Lcom/flyersoft/moonreaderp/ActivityTxt;->getWindow()Landroid/view/Window;

    move-result-object p1

    invoke-virtual {p1}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v5

    invoke-direct/range {v0 .. v5}, Lcom/flyersoft/moonreaderp/PrefEditBookmark;-><init>(Landroid/content/Context;Ljava/lang/String;Lcom/flyersoft/moonreaderp/PrefEditBookmark$OnAfterEdit;Ljava/lang/Integer;Landroid/view/View;)V

    return-void
.end method
