.class Lcom/flyersoft/moonreaderp/PrefThumbnails$ThumbAdapter$1;
.super Ljava/lang/Object;
.source "PrefThumbnails.java"

# interfaces
.implements Lcom/flyersoft/views/recyclerview/MyRecyclerView$OnFillData;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flyersoft/moonreaderp/PrefThumbnails$ThumbAdapter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/flyersoft/moonreaderp/PrefThumbnails$ThumbAdapter;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/PrefThumbnails$ThumbAdapter;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 240
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefThumbnails$ThumbAdapter$1;->this$1:Lcom/flyersoft/moonreaderp/PrefThumbnails$ThumbAdapter;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public fillData(ILandroid/view/View;)V
    .locals 1

    .line 243
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefThumbnails$ThumbAdapter$1;->this$1:Lcom/flyersoft/moonreaderp/PrefThumbnails$ThumbAdapter;

    invoke-virtual {v0, p1, p2}, Lcom/flyersoft/moonreaderp/PrefThumbnails$ThumbAdapter;->getView(ILandroid/view/View;)V

    return-void
.end method
