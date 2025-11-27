.class Lcom/flyersoft/moonreaderp/PrefMisc$100;
.super Ljava/lang/Thread;
.source "PrefMisc.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/PrefMisc;->restoreProc_over(Landroid/content/Context;Landroid/os/Handler;Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic val$context:Landroid/content/Context;

.field final synthetic val$fromMain:Z

.field final synthetic val$handler:Landroid/os/Handler;


# direct methods
.method constructor <init>(Landroid/content/Context;Landroid/os/Handler;Z)V
    .locals 0

    .line 2567
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefMisc$100;->val$context:Landroid/content/Context;

    iput-object p2, p0, Lcom/flyersoft/moonreaderp/PrefMisc$100;->val$handler:Landroid/os/Handler;

    iput-boolean p3, p0, Lcom/flyersoft/moonreaderp/PrefMisc$100;->val$fromMain:Z

    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .line 2570
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefMisc$100;->val$context:Landroid/content/Context;

    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefMisc$100;->val$handler:Landroid/os/Handler;

    iget-boolean v2, p0, Lcom/flyersoft/moonreaderp/PrefMisc$100;->val$fromMain:Z

    invoke-static {v0, v1, v2}, Lcom/flyersoft/moonreaderp/PrefMisc;->restoreProc_over2(Landroid/content/Context;Landroid/os/Handler;Z)V

    return-void
.end method
