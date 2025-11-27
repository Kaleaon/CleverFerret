.class Lcom/flyersoft/moonreaderp/ActivityTxt$79$1;
.super Ljava/lang/Object;
.source "ActivityTxt.java"

# interfaces
.implements Lcom/flyersoft/moonreaderp/PrefEditBookmark$OnAfterEdit;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/ActivityTxt$79;->onClick(I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/flyersoft/moonreaderp/ActivityTxt$79;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/ActivityTxt$79;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 7774
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$79$1;->this$1:Lcom/flyersoft/moonreaderp/ActivityTxt$79;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public AfterEdit(Ljava/lang/String;Ljava/lang/Integer;)V
    .locals 1

    .line 7776
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$79$1;->this$1:Lcom/flyersoft/moonreaderp/ActivityTxt$79;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityTxt$79;->val$bm:Lcom/flyersoft/tools/A$Bookmark;

    iput-object p1, v0, Lcom/flyersoft/tools/A$Bookmark;->name:Ljava/lang/String;

    .line 7777
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$79$1;->this$1:Lcom/flyersoft/moonreaderp/ActivityTxt$79;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/ActivityTxt$79;->val$bm:Lcom/flyersoft/tools/A$Bookmark;

    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    move-result p2

    iput p2, p1, Lcom/flyersoft/tools/A$Bookmark;->color:I

    .line 7778
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$79$1;->this$1:Lcom/flyersoft/moonreaderp/ActivityTxt$79;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/ActivityTxt$79;->val$bm:Lcom/flyersoft/tools/A$Bookmark;

    invoke-static {p1}, Lcom/flyersoft/tools/A;->updateBookmark(Lcom/flyersoft/tools/A$Bookmark;)V

    const/4 p1, 0x1

    .line 7779
    sput-boolean p1, Lcom/flyersoft/tools/A;->hasNewNoteForUpload:Z

    .line 7780
    sput-boolean p1, Lcom/flyersoft/tools/A;->lastFileAnnotUpdated:Z

    .line 7781
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$79$1;->this$1:Lcom/flyersoft/moonreaderp/ActivityTxt$79;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/ActivityTxt$79;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {p1}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$mupdateForFitHardwareAccelerate(Lcom/flyersoft/moonreaderp/ActivityTxt;)Z

    move-result p1

    if-nez p1, :cond_0

    .line 7782
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$79$1;->this$1:Lcom/flyersoft/moonreaderp/ActivityTxt$79;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/ActivityTxt$79;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/ActivityTxt;->contentLay:Lcom/flyersoft/views/ContentLay;

    invoke-virtual {p1}, Lcom/flyersoft/views/ContentLay;->postInvalidate()V

    :cond_0
    return-void
.end method
