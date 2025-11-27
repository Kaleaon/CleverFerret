.class public Lcom/flyersoft/tools/A$Filter_Item;
.super Ljava/lang/Object;
.source "A.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flyersoft/tools/A;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Filter_Item"
.end annotation


# instance fields
.field public fromBook:Z

.field public missing:Z

.field public original:Ljava/lang/String;

.field public replaceWith:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 6869
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6870
    iput-object p1, p0, Lcom/flyersoft/tools/A$Filter_Item;->original:Ljava/lang/String;

    .line 6871
    iput-object p2, p0, Lcom/flyersoft/tools/A$Filter_Item;->replaceWith:Ljava/lang/String;

    return-void
.end method
