.class Lcom/flyersoft/moonreaderp/PrefMisc$99;
.super Ljava/lang/Object;
.source "PrefMisc.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/PrefMisc;->restoreProc_final(Landroid/content/Context;Landroid/os/Handler;ZI)V
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
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 2554
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefMisc$99;->val$context:Landroid/content/Context;

    iput-object p2, p0, Lcom/flyersoft/moonreaderp/PrefMisc$99;->val$handler:Landroid/os/Handler;

    iput-boolean p3, p0, Lcom/flyersoft/moonreaderp/PrefMisc$99;->val$fromMain:Z

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 1

    .line 2557
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefMisc$99;->val$context:Landroid/content/Context;

    iget-object p2, p0, Lcom/flyersoft/moonreaderp/PrefMisc$99;->val$handler:Landroid/os/Handler;

    iget-boolean v0, p0, Lcom/flyersoft/moonreaderp/PrefMisc$99;->val$fromMain:Z

    invoke-static {p1, p2, v0}, Lcom/flyersoft/moonreaderp/PrefMisc;->restoreProc_over(Landroid/content/Context;Landroid/os/Handler;Z)V

    return-void
.end method
