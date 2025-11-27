.class Lcom/flyersoft/moonreaderp/PrefVisual$2;
.super Ljava/lang/Object;
.source "PrefVisual.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/PrefVisual;->setFlipImagesClick()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/moonreaderp/PrefVisual;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/PrefVisual;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 201
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefVisual$2;->this$0:Lcom/flyersoft/moonreaderp/PrefVisual;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 1

    .line 204
    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/String;

    invoke-static {p1}, Lcom/flyersoft/tools/T;->string2Int(Ljava/lang/String;)I

    move-result p1

    sput p1, Lcom/flyersoft/tools/A;->flip_ebook:I

    sput p1, Lcom/flyersoft/tools/A;->flip_animation:I

    .line 205
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefVisual$2;->this$0:Lcom/flyersoft/moonreaderp/PrefVisual;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/PrefVisual;->flip_type_sp:Landroid/widget/Spinner;

    sget v0, Lcom/flyersoft/tools/A;->flip_animation:I

    invoke-virtual {p1, v0}, Landroid/widget/Spinner;->setSelection(I)V

    .line 206
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefVisual$2;->this$0:Lcom/flyersoft/moonreaderp/PrefVisual;

    invoke-static {p1}, Lcom/flyersoft/moonreaderp/PrefVisual;->-$$Nest$msetFlipLayVisiblity(Lcom/flyersoft/moonreaderp/PrefVisual;)V

    return-void
.end method
