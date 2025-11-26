.class public Lcom/flyersoft/tools/T$NatureSortItem;
.super Ljava/lang/Object;
.source "T.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flyersoft/tools/T;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "NatureSortItem"
.end annotation


# instance fields
.field public body:Ljava/lang/String;

.field public endNum:I

.field public headerNum:I


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 486
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 487
    iput v0, p0, Lcom/flyersoft/tools/T$NatureSortItem;->headerNum:I

    const/4 v1, 0x0

    .line 488
    iput-object v1, p0, Lcom/flyersoft/tools/T$NatureSortItem;->body:Ljava/lang/String;

    .line 489
    iput v0, p0, Lcom/flyersoft/tools/T$NatureSortItem;->endNum:I

    return-void
.end method
