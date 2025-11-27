.class Lcom/flyersoft/moonreaderp/PrefVisual$27;
.super Ljava/lang/Object;
.source "PrefVisual.java"

# interfaces
.implements Lcom/flyersoft/moonreaderp/PrefColorPick$OnSaveColor;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/PrefVisual;->onClick(Landroid/view/View;)V
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

    .line 884
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefVisual$27;->this$0:Lcom/flyersoft/moonreaderp/PrefVisual;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public getColor(I)V
    .locals 1

    .line 886
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefVisual$27;->this$0:Lcom/flyersoft/moonreaderp/PrefVisual;

    invoke-static {v0, p1}, Lcom/flyersoft/moonreaderp/PrefVisual;->-$$Nest$msetFontColor(Lcom/flyersoft/moonreaderp/PrefVisual;I)Z

    move-result p1

    if-eqz p1, :cond_0

    .line 887
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefVisual$27;->this$0:Lcom/flyersoft/moonreaderp/PrefVisual;

    invoke-static {p1}, Lcom/flyersoft/moonreaderp/PrefVisual;->-$$Nest$mshowSaveThemeHint(Lcom/flyersoft/moonreaderp/PrefVisual;)V

    :cond_0
    return-void
.end method
