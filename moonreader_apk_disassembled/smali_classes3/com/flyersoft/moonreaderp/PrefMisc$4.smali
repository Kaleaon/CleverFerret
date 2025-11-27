.class Lcom/flyersoft/moonreaderp/PrefMisc$4;
.super Ljava/lang/Object;
.source "PrefMisc.java"

# interfaces
.implements Landroid/widget/CompoundButton$OnCheckedChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/PrefMisc;->loadSettings()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/moonreaderp/PrefMisc;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/PrefMisc;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 261
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefMisc$4;->this$0:Lcom/flyersoft/moonreaderp/PrefMisc;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onCheckedChanged(Landroid/widget/CompoundButton;Z)V
    .locals 0

    .line 264
    sget p1, Lcom/flyersoft/tools/A;->showRuler:I

    if-nez p1, :cond_1

    const/4 p1, 0x1

    if-eqz p2, :cond_0

    const/4 p2, 0x1

    goto :goto_0

    :cond_0
    const/4 p2, -0x1

    .line 265
    :goto_0
    sput p2, Lcom/flyersoft/tools/A;->showRuler:I

    .line 266
    iget-object p2, p0, Lcom/flyersoft/moonreaderp/PrefMisc$4;->this$0:Lcom/flyersoft/moonreaderp/PrefMisc;

    invoke-virtual {p2}, Lcom/flyersoft/moonreaderp/PrefMisc;->getContext()Landroid/content/Context;

    move-result-object p2

    invoke-static {p2, p1}, Lcom/flyersoft/views/RulerView;->showRulerOptions(Landroid/content/Context;Z)V

    return-void

    .line 268
    :cond_1
    invoke-static {p2}, Lcom/flyersoft/views/RulerView;->reloadRulerInReader(Z)V

    return-void
.end method
