.class Lcom/flyersoft/moonreaderp/PrefThumbnails$ThumbAdapter$2;
.super Ljava/lang/Object;
.source "PrefThumbnails.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


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

    .line 278
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefThumbnails$ThumbAdapter$2;->this$1:Lcom/flyersoft/moonreaderp/PrefThumbnails$ThumbAdapter;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 1

    .line 281
    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Integer;

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 282
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefThumbnails$ThumbAdapter$2;->this$1:Lcom/flyersoft/moonreaderp/PrefThumbnails$ThumbAdapter;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/PrefThumbnails$ThumbAdapter;->this$0:Lcom/flyersoft/moonreaderp/PrefThumbnails;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/PrefThumbnails;->onResult:Lcom/flyersoft/tools/T$OnResult;

    invoke-interface {v0, p1}, Lcom/flyersoft/tools/T$OnResult;->done(Ljava/lang/Object;)V

    .line 283
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefThumbnails$ThumbAdapter$2;->this$1:Lcom/flyersoft/moonreaderp/PrefThumbnails$ThumbAdapter;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/PrefThumbnails$ThumbAdapter;->this$0:Lcom/flyersoft/moonreaderp/PrefThumbnails;

    invoke-virtual {p1}, Lcom/flyersoft/moonreaderp/PrefThumbnails;->dismiss()V

    return-void
.end method
