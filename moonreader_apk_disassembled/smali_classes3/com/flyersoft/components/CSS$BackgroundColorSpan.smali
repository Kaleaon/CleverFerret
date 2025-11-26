.class public Lcom/flyersoft/components/CSS$BackgroundColorSpan;
.super Ljava/lang/Object;
.source "CSS.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flyersoft/components/CSS;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "BackgroundColorSpan"
.end annotation


# instance fields
.field public color:I


# direct methods
.method public constructor <init>(I)V
    .locals 0

    .line 39
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 40
    iput p1, p0, Lcom/flyersoft/components/CSS$BackgroundColorSpan;->color:I

    return-void
.end method
