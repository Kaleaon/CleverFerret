.class Lcom/flyersoft/moonreaderp/PrefShelf$9$1;
.super Ljava/lang/Object;
.source "PrefShelf.java"

# interfaces
.implements Lcom/flyersoft/moonreaderp/PrefColorPick$OnSaveColor;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/PrefShelf$9;->onClick(Landroid/view/View;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/flyersoft/moonreaderp/PrefShelf$9;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/PrefShelf$9;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 353
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefShelf$9$1;->this$1:Lcom/flyersoft/moonreaderp/PrefShelf$9;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public getColor(I)V
    .locals 2

    .line 356
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefShelf$9$1;->this$1:Lcom/flyersoft/moonreaderp/PrefShelf$9;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/PrefShelf$9;->val$colorIv:Lcom/google/android/material/imageview/ShapeableImageView;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/google/android/material/imageview/ShapeableImageView;->setTag(Ljava/lang/Object;)V

    .line 357
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefShelf$9$1;->this$1:Lcom/flyersoft/moonreaderp/PrefShelf$9;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/PrefShelf$9;->val$colorIv:Lcom/google/android/material/imageview/ShapeableImageView;

    new-instance v1, Landroid/graphics/drawable/ColorDrawable;

    invoke-direct {v1, p1}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V

    invoke-virtual {v0, v1}, Lcom/google/android/material/imageview/ShapeableImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    return-void
.end method
