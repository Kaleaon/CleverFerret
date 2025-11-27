.class Lcom/flyersoft/moonreaderp/PrefGroupBooks$MergedAdapter$1;
.super Ljava/lang/Object;
.source "PrefGroupBooks.java"

# interfaces
.implements Lcom/flyersoft/views/recyclerview/MyRecyclerView$OnFillData;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flyersoft/moonreaderp/PrefGroupBooks$MergedAdapter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/flyersoft/moonreaderp/PrefGroupBooks$MergedAdapter;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/PrefGroupBooks$MergedAdapter;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 237
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefGroupBooks$MergedAdapter$1;->this$1:Lcom/flyersoft/moonreaderp/PrefGroupBooks$MergedAdapter;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public fillData(ILandroid/view/View;)V
    .locals 2

    .line 240
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefGroupBooks$MergedAdapter$1;->this$1:Lcom/flyersoft/moonreaderp/PrefGroupBooks$MergedAdapter;

    const/4 v1, 0x0

    invoke-virtual {v0, p1, p2, v1}, Lcom/flyersoft/moonreaderp/PrefGroupBooks$MergedAdapter;->fillItemData(ILandroid/view/View;Z)V

    return-void
.end method
