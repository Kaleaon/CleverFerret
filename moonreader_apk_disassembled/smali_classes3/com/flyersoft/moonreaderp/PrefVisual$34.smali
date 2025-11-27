.class Lcom/flyersoft/moonreaderp/PrefVisual$34;
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

    .line 1112
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefVisual$34;->this$0:Lcom/flyersoft/moonreaderp/PrefVisual;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 0

    .line 1115
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefVisual$34;->this$0:Lcom/flyersoft/moonreaderp/PrefVisual;

    iput p2, p1, Lcom/flyersoft/moonreaderp/PrefVisual;->fontWeightSelected:I

    return-void
.end method
