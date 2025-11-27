.class Lcom/flyersoft/moonreaderp/PrefVisual$33;
.super Ljava/lang/Object;
.source "PrefVisual.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/PrefVisual;->showFontWeightDialog()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/moonreaderp/PrefVisual;

.field final synthetic val$list:Ljava/util/ArrayList;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/PrefVisual;Ljava/util/ArrayList;)V
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

    .line 1117
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefVisual$33;->this$0:Lcom/flyersoft/moonreaderp/PrefVisual;

    iput-object p2, p0, Lcom/flyersoft/moonreaderp/PrefVisual$33;->val$list:Ljava/util/ArrayList;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 1

    .line 1120
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefVisual$33;->this$0:Lcom/flyersoft/moonreaderp/PrefVisual;

    iget-object p2, p0, Lcom/flyersoft/moonreaderp/PrefVisual$33;->val$list:Ljava/util/ArrayList;

    iget v0, p1, Lcom/flyersoft/moonreaderp/PrefVisual;->fontWeightSelected:I

    invoke-virtual {p2, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Ljava/lang/String;

    invoke-static {p1, p2}, Lcom/flyersoft/moonreaderp/PrefVisual;->-$$Nest$mshowFontWeightDialog(Lcom/flyersoft/moonreaderp/PrefVisual;Ljava/lang/String;)V

    return-void
.end method
