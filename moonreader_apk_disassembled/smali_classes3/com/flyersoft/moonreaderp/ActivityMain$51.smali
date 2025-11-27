.class Lcom/flyersoft/moonreaderp/ActivityMain$51;
.super Ljava/lang/Thread;
.source "ActivityMain.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/ActivityMain;->searchAuthorsSeriesTags(Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/moonreaderp/ActivityMain;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/ActivityMain;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 4673
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$51;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 8

    const/4 v0, 0x1

    .line 4676
    new-array v1, v0, [Ljava/lang/Object;

    const/4 v2, 0x0

    const-string v3, "prepare authorSeariesTags search"

    aput-object v3, v1, v2

    invoke-static {v1}, Lcom/flyersoft/tools/A;->log([Ljava/lang/Object;)V

    .line 4677
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v3

    .line 4678
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$51;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v1, v1, Lcom/flyersoft/moonreaderp/ActivityMain;->authorsBC:Ljava/util/ArrayList;

    if-nez v1, :cond_0

    .line 4679
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$51;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    const/4 v5, 0x3

    invoke-static {v5, v2, v2}, Lcom/flyersoft/tools/BookDb;->getBookCollection(IZZ)Ljava/util/ArrayList;

    move-result-object v5

    iput-object v5, v1, Lcom/flyersoft/moonreaderp/ActivityMain;->authorsBC:Ljava/util/ArrayList;

    .line 4680
    :cond_0
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$51;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v1, v1, Lcom/flyersoft/moonreaderp/ActivityMain;->seriesBC:Ljava/util/ArrayList;

    const/4 v5, 0x2

    if-nez v1, :cond_1

    .line 4681
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$51;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-static {v5, v2, v2}, Lcom/flyersoft/tools/BookDb;->getBookCollection(IZZ)Ljava/util/ArrayList;

    move-result-object v6

    iput-object v6, v1, Lcom/flyersoft/moonreaderp/ActivityMain;->seriesBC:Ljava/util/ArrayList;

    .line 4682
    :cond_1
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$51;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v1, v1, Lcom/flyersoft/moonreaderp/ActivityMain;->tagsBC:Ljava/util/ArrayList;

    if-nez v1, :cond_2

    .line 4683
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$51;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    const/4 v6, 0x4

    invoke-static {v6, v2, v2}, Lcom/flyersoft/tools/BookDb;->getBookCollection(IZZ)Ljava/util/ArrayList;

    move-result-object v6

    iput-object v6, v1, Lcom/flyersoft/moonreaderp/ActivityMain;->tagsBC:Ljava/util/ArrayList;

    .line 4684
    :cond_2
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$51;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iput-boolean v2, v1, Lcom/flyersoft/moonreaderp/ActivityMain;->authorSeriesTagsSearchInPrepare:Z

    .line 4685
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v6

    sub-long/2addr v6, v3

    invoke-static {v6, v7}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    new-array v3, v5, [Ljava/lang/Object;

    const-string v4, "prepare time"

    aput-object v4, v3, v2

    aput-object v1, v3, v0

    invoke-static {v3}, Lcom/flyersoft/tools/A;->log([Ljava/lang/Object;)V

    return-void
.end method
