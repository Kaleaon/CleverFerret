.class public Lcom/flyersoft/staticlayout/MyHtml$Emphasis;
.super Ljava/lang/Object;
.source "MyHtml.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flyersoft/staticlayout/MyHtml;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Emphasis"
.end annotation


# instance fields
.field public emphasis:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 0

    .line 126
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 127
    iput-object p1, p0, Lcom/flyersoft/staticlayout/MyHtml$Emphasis;->emphasis:Ljava/lang/String;

    return-void
.end method
