.class Lcom/flyersoft/moonreaderp/ActivityTxt$12;
.super Ljava/lang/Object;
.source "ActivityTxt.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/ActivityTxt;->preShowTxtChapterList()V
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

    .line 1650
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$12;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 6

    .line 1652
    invoke-static {}, Lcom/flyersoft/tools/A;->getTxtChapters()Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-lez v0, :cond_0

    .line 1654
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$12;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    const/16 v2, 0xc8

    invoke-static {v1, v2}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$mforceUpdateForFitHardwareAccelerate(Lcom/flyersoft/moonreaderp/ActivityTxt;I)V

    .line 1655
    :cond_0
    sget-wide v1, Lcom/flyersoft/tools/A;->lastPosition:J

    const-wide/16 v3, 0x0

    cmp-long v5, v1, v3

    if-nez v5, :cond_3

    sget-boolean v1, Lcom/flyersoft/tools/A;->isChinese:Z

    if-nez v1, :cond_1

    goto :goto_0

    .line 1657
    :cond_1
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$12;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-boolean v1, v1, Lcom/flyersoft/moonreaderp/ActivityTxt;->ignoreChapterListAtBegin:Z

    if-eqz v1, :cond_2

    goto :goto_0

    .line 1659
    :cond_2
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$12;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    const/4 v2, 0x1

    iput-boolean v2, v1, Lcom/flyersoft/moonreaderp/ActivityTxt;->ignoreChapterListAtBegin:Z

    const/4 v1, 0x5

    if-le v0, v1, :cond_3

    .line 1660
    sget-wide v0, Lcom/flyersoft/tools/A;->lastPosition:J

    cmp-long v2, v0, v3

    if-nez v2, :cond_3

    .line 1661
    sget-boolean v0, Lcom/flyersoft/tools/A;->listChaptersForNewBook:Z

    if-eqz v0, :cond_3

    .line 1662
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$12;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/flyersoft/moonreaderp/ActivityTxt;->do_show_chapters(I)V

    :cond_3
    :goto_0
    return-void
.end method
