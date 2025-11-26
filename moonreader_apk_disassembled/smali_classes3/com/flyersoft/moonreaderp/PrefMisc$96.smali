.class Lcom/flyersoft/moonreaderp/PrefMisc$96;
.super Ljava/lang/Object;
.source "PrefMisc.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/PrefMisc;->doAfterRestoreSuccess(Landroid/content/Context;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .line 2491
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 0

    .line 2494
    invoke-static {}, Lcom/flyersoft/tools/A;->printAllInnerFiles()V

    const/4 p1, 0x0

    .line 2495
    invoke-static {p1}, Ljava/lang/System;->exit(I)V

    return-void
.end method
