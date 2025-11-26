.class Lcom/flyersoft/staticlayout/HtmlToSpannedConverter$Emphasis_Tag;
.super Ljava/lang/Object;
.source "MyHtml.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flyersoft/staticlayout/HtmlToSpannedConverter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "Emphasis_Tag"
.end annotation


# instance fields
.field public emphasis:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 0

    .line 3226
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 3227
    iput-object p1, p0, Lcom/flyersoft/staticlayout/HtmlToSpannedConverter$Emphasis_Tag;->emphasis:Ljava/lang/String;

    return-void
.end method
