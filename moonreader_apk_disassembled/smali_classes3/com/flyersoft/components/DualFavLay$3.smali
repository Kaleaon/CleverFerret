.class Lcom/flyersoft/components/DualFavLay$3;
.super Ljava/lang/Thread;
.source "DualFavLay.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/components/DualFavLay;->initLay1(Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/components/DualFavLay;

.field final synthetic val$searchKey:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/flyersoft/components/DualFavLay;Ljava/lang/String;)V
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

    .line 175
    iput-object p1, p0, Lcom/flyersoft/components/DualFavLay$3;->this$0:Lcom/flyersoft/components/DualFavLay;

    iput-object p2, p0, Lcom/flyersoft/components/DualFavLay$3;->val$searchKey:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .line 177
    sget v0, Lcom/flyersoft/tools/A;->dualFavType:I

    const/4 v1, 0x0

    invoke-static {v0, v1, v1}, Lcom/flyersoft/tools/BookDb;->getBookCollection(IZZ)Ljava/util/ArrayList;

    move-result-object v0

    .line 178
    sget-object v2, Lcom/flyersoft/components/DualFavLay;->selfPref:Lcom/flyersoft/components/DualFavLay;

    if-nez v2, :cond_0

    goto :goto_0

    .line 180
    :cond_0
    iget-object v2, p0, Lcom/flyersoft/components/DualFavLay$3;->this$0:Lcom/flyersoft/components/DualFavLay;

    iget-object v2, v2, Lcom/flyersoft/components/DualFavLay;->rv:Lcom/flyersoft/views/recyclerview/MyRecyclerView;

    invoke-virtual {v2}, Lcom/flyersoft/views/recyclerview/MyRecyclerView;->getTag()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Integer;

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    sget v3, Lcom/flyersoft/tools/A;->dualFavType:I

    if-eq v2, v3, :cond_1

    :goto_0
    return-void

    .line 182
    :cond_1
    iget-object v2, p0, Lcom/flyersoft/components/DualFavLay$3;->this$0:Lcom/flyersoft/components/DualFavLay;

    iput-object v0, v2, Lcom/flyersoft/components/DualFavLay;->collections:Ljava/util/ArrayList;

    .line 183
    iget-object v0, p0, Lcom/flyersoft/components/DualFavLay$3;->this$0:Lcom/flyersoft/components/DualFavLay;

    iget-object v2, p0, Lcom/flyersoft/components/DualFavLay$3;->val$searchKey:Ljava/lang/String;

    iput-object v2, v0, Lcom/flyersoft/components/DualFavLay;->key:Ljava/lang/String;

    .line 185
    new-instance v0, Lcom/flyersoft/components/DualFavLay$3$1;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v2

    invoke-direct {v0, p0, v2}, Lcom/flyersoft/components/DualFavLay$3$1;-><init>(Lcom/flyersoft/components/DualFavLay$3;Landroid/os/Looper;)V

    .line 193
    invoke-virtual {v0, v1}, Lcom/flyersoft/components/DualFavLay$3$1;->sendEmptyMessage(I)Z

    return-void
.end method
