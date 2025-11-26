.class public Lcom/flyersoft/staticlayout/MyHtml$Ruby;
.super Ljava/lang/Object;
.source "MyHtml.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flyersoft/staticlayout/MyHtml;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Ruby"
.end annotation


# instance fields
.field public end:I

.field public original:Ljava/lang/String;

.field public rt:Ljava/lang/String;

.field public start:I


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;II)V
    .locals 0

    .line 116
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 117
    iput-object p1, p0, Lcom/flyersoft/staticlayout/MyHtml$Ruby;->rt:Ljava/lang/String;

    .line 118
    iput-object p2, p0, Lcom/flyersoft/staticlayout/MyHtml$Ruby;->original:Ljava/lang/String;

    .line 119
    iput p3, p0, Lcom/flyersoft/staticlayout/MyHtml$Ruby;->start:I

    .line 120
    iput p4, p0, Lcom/flyersoft/staticlayout/MyHtml$Ruby;->end:I

    return-void
.end method
