.class public Lcom/flyersoft/tools/BookDb$BookCollection;
.super Ljava/lang/Object;
.source "BookDb.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flyersoft/tools/BookDb;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "BookCollection"
.end annotation


# instance fields
.field public fieldName:Ljava/lang/String;

.field public fieldValue:Ljava/lang/String;

.field public multiType:Z

.field public topId:I


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Z)V
    .locals 1

    .line 847
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, -0x2

    .line 845
    iput v0, p0, Lcom/flyersoft/tools/BookDb$BookCollection;->topId:I

    .line 848
    iput-object p1, p0, Lcom/flyersoft/tools/BookDb$BookCollection;->fieldName:Ljava/lang/String;

    .line 849
    iput-object p2, p0, Lcom/flyersoft/tools/BookDb$BookCollection;->fieldValue:Ljava/lang/String;

    .line 850
    iput-boolean p3, p0, Lcom/flyersoft/tools/BookDb$BookCollection;->multiType:Z

    return-void
.end method
