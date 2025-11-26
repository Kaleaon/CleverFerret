.class public final synthetic Lcom/flyersoft/moonreaderp/ActivityTxt$LayoutStateChangeCallback$$ExternalSyntheticLambda0;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic f$0:Lcom/flyersoft/moonreaderp/ActivityTxt$LayoutStateChangeCallback;

.field public final synthetic f$1:Landroidx/window/layout/WindowLayoutInfo;


# direct methods
.method public synthetic constructor <init>(Lcom/flyersoft/moonreaderp/ActivityTxt$LayoutStateChangeCallback;Landroidx/window/layout/WindowLayoutInfo;)V
    .locals 0

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$LayoutStateChangeCallback$$ExternalSyntheticLambda0;->f$0:Lcom/flyersoft/moonreaderp/ActivityTxt$LayoutStateChangeCallback;

    iput-object p2, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$LayoutStateChangeCallback$$ExternalSyntheticLambda0;->f$1:Landroidx/window/layout/WindowLayoutInfo;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    .line 0
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$LayoutStateChangeCallback$$ExternalSyntheticLambda0;->f$0:Lcom/flyersoft/moonreaderp/ActivityTxt$LayoutStateChangeCallback;

    iget-object v1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$LayoutStateChangeCallback$$ExternalSyntheticLambda0;->f$1:Landroidx/window/layout/WindowLayoutInfo;

    invoke-virtual {v0, v1}, Lcom/flyersoft/moonreaderp/ActivityTxt$LayoutStateChangeCallback;->lambda$accept$0$com-flyersoft-moonreaderp-ActivityTxt$LayoutStateChangeCallback(Landroidx/window/layout/WindowLayoutInfo;)V

    return-void
.end method
