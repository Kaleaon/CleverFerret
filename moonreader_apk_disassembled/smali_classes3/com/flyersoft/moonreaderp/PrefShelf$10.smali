.class Lcom/flyersoft/moonreaderp/PrefShelf$10;
.super Ljava/lang/Object;
.source "PrefShelf.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


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

    .line 364
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefShelf$10;->this$0:Lcom/flyersoft/moonreaderp/PrefShelf;

    iput-object p2, p0, Lcom/flyersoft/moonreaderp/PrefShelf$10;->val$colorIv:Lcom/google/android/material/imageview/ShapeableImageView;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 0

    .line 367
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefShelf$10;->val$colorIv:Lcom/google/android/material/imageview/ShapeableImageView;

    invoke-virtual {p1}, Lcom/google/android/material/imageview/ShapeableImageView;->getTag()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Integer;

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    sput p1, Lcom/flyersoft/tools/A;->customDynamicColor:I

    const/4 p1, 0x1

    .line 368
    sput-boolean p1, Lcom/flyersoft/tools/A;->useDynamicColor:Z

    .line 369
    sget p2, Lcom/flyersoft/tools/A;->customDynamicColor:I

    invoke-static {p2}, Lcom/flyersoft/tools/C;->getDynamicColorsFromColor(I)V

    .line 370
    iget-object p2, p0, Lcom/flyersoft/moonreaderp/PrefShelf$10;->this$0:Lcom/flyersoft/moonreaderp/PrefShelf;

    iget-object p2, p2, Lcom/flyersoft/moonreaderp/PrefShelf;->dynamicMS:Lcom/google/android/material/materialswitch/MaterialSwitch;

    invoke-virtual {p2, p1}, Lcom/google/android/material/materialswitch/MaterialSwitch;->setChecked(Z)V

    .line 371
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefShelf$10;->this$0:Lcom/flyersoft/moonreaderp/PrefShelf;

    invoke-static {p1}, Lcom/flyersoft/moonreaderp/PrefShelf;->-$$Nest$mdoAfterDynamicColorChanged(Lcom/flyersoft/moonreaderp/PrefShelf;)V

    return-void
.end method
