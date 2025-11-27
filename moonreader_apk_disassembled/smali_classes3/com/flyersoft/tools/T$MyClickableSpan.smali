.class public abstract Lcom/flyersoft/tools/T$MyClickableSpan;
.super Landroid/text/style/ClickableSpan;
.source "T.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flyersoft/tools/T;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x409
    name = "MyClickableSpan"
.end annotation


# instance fields
.field public onUrlClick:Lcom/flyersoft/tools/T$OnUrlClick;

.field public url:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 3133
    invoke-direct {p0}, Landroid/text/style/ClickableSpan;-><init>()V

    return-void
.end method
