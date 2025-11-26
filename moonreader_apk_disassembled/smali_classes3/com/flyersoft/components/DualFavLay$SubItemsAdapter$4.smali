.class Lcom/flyersoft/components/DualFavLay$SubItemsAdapter$4;
.super Ljava/lang/Object;
.source "DualFavLay.java"

# interfaces
.implements Landroid/view/View$OnLongClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flyersoft/components/DualFavLay$SubItemsAdapter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/flyersoft/components/DualFavLay$SubItemsAdapter;


# direct methods
.method constructor <init>(Lcom/flyersoft/components/DualFavLay$SubItemsAdapter;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 438
    iput-object p1, p0, Lcom/flyersoft/components/DualFavLay$SubItemsAdapter$4;->this$1:Lcom/flyersoft/components/DualFavLay$SubItemsAdapter;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onLongClick(Landroid/view/View;)Z
    .locals 2

    .line 441
    iget-object v0, p0, Lcom/flyersoft/components/DualFavLay$SubItemsAdapter$4;->this$1:Lcom/flyersoft/components/DualFavLay$SubItemsAdapter;

    iget-object v0, v0, Lcom/flyersoft/components/DualFavLay$SubItemsAdapter;->onOverflowClick:Landroid/view/View$OnClickListener;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->tv2:I

    invoke-virtual {p1, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    invoke-interface {v0, p1}, Landroid/view/View$OnClickListener;->onClick(Landroid/view/View;)V

    const/4 p1, 0x0

    return p1
.end method
