.class Lcom/flyersoft/moonreaderp/PrefShelf$9;
.super Ljava/lang/Object;
.source "PrefShelf.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/PrefShelf;->showCustomDynamicPicker()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/moonreaderp/PrefShelf;

.field final synthetic val$colorIv:Lcom/google/android/material/imageview/ShapeableImageView;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/PrefShelf;Lcom/google/android/material/imageview/ShapeableImageView;)V
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

    .line 349
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefShelf$9;->this$0:Lcom/flyersoft/moonreaderp/PrefShelf;

    iput-object p2, p0, Lcom/flyersoft/moonreaderp/PrefShelf$9;->val$colorIv:Lcom/google/android/material/imageview/ShapeableImageView;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 6

    .line 352
    new-instance v0, Lcom/flyersoft/moonreaderp/PrefColorPick;

    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefShelf$9;->this$0:Lcom/flyersoft/moonreaderp/PrefShelf;

    invoke-virtual {p1}, Lcom/flyersoft/moonreaderp/PrefShelf;->getContext()Landroid/content/Context;

    move-result-object v1

    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefShelf$9;->this$0:Lcom/flyersoft/moonreaderp/PrefShelf;

    invoke-virtual {p1}, Lcom/flyersoft/moonreaderp/PrefShelf;->getContext()Landroid/content/Context;

    move-result-object p1

    sget v2, Lcom/flyersoft/moonreaderp/R$string;->custom_dynamic_color:I

    invoke-virtual {p1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v2

    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefShelf$9;->val$colorIv:Lcom/google/android/material/imageview/ShapeableImageView;

    .line 353
    invoke-virtual {p1}, Lcom/google/android/material/imageview/ShapeableImageView;->getTag()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Integer;

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result v4

    new-instance v5, Lcom/flyersoft/moonreaderp/PrefShelf$9$1;

    invoke-direct {v5, p0}, Lcom/flyersoft/moonreaderp/PrefShelf$9$1;-><init>(Lcom/flyersoft/moonreaderp/PrefShelf$9;)V

    const/4 v3, 0x0

    invoke-direct/range {v0 .. v5}, Lcom/flyersoft/moonreaderp/PrefColorPick;-><init>(Landroid/content/Context;Ljava/lang/String;ZILcom/flyersoft/moonreaderp/PrefColorPick$OnSaveColor;)V

    .line 359
    invoke-virtual {v0}, Lcom/flyersoft/moonreaderp/PrefColorPick;->show()V

    return-void
.end method
