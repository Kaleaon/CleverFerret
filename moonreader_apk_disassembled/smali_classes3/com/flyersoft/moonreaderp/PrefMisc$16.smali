.class Lcom/flyersoft/moonreaderp/PrefMisc$16;
.super Ljava/lang/Object;
.source "PrefMisc.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/PrefMisc;->onClick(Landroid/view/View;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/moonreaderp/PrefMisc;

.field final synthetic val$sp:Landroid/widget/Spinner;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/PrefMisc;Landroid/widget/Spinner;)V
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

    .line 670
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefMisc$16;->this$0:Lcom/flyersoft/moonreaderp/PrefMisc;

    iput-object p2, p0, Lcom/flyersoft/moonreaderp/PrefMisc$16;->val$sp:Landroid/widget/Spinner;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 0

    .line 672
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefMisc$16;->val$sp:Landroid/widget/Spinner;

    invoke-virtual {p1}, Landroid/widget/Spinner;->getSelectedItemPosition()I

    move-result p1

    sput p1, Lcom/flyersoft/tools/A;->fontsize_edge:I

    return-void
.end method
