.class Lorg/nibor/autolink/LinkExtractor$1;
.super Ljava/lang/Object;
.source "LinkExtractor.java"

# interfaces
.implements Ljava/lang/Iterable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/nibor/autolink/LinkExtractor;->extractLinks(Ljava/lang/CharSequence;)Ljava/lang/Iterable;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/lang/Iterable<",
        "Lorg/nibor/autolink/LinkSpan;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lorg/nibor/autolink/LinkExtractor;

.field final synthetic val$input:Ljava/lang/CharSequence;


# direct methods
.method constructor <init>(Lorg/nibor/autolink/LinkExtractor;Ljava/lang/CharSequence;)V
    .locals 0

    .line 38
    iput-object p1, p0, Lorg/nibor/autolink/LinkExtractor$1;->this$0:Lorg/nibor/autolink/LinkExtractor;

    iput-object p2, p0, Lorg/nibor/autolink/LinkExtractor$1;->val$input:Ljava/lang/CharSequence;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public iterator()Ljava/util/Iterator;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Iterator<",
            "Lorg/nibor/autolink/LinkSpan;",
            ">;"
        }
    .end annotation

    .line 41
    new-instance v0, Lorg/nibor/autolink/LinkExtractor$LinkIterator;

    iget-object v1, p0, Lorg/nibor/autolink/LinkExtractor$1;->this$0:Lorg/nibor/autolink/LinkExtractor;

    iget-object v2, p0, Lorg/nibor/autolink/LinkExtractor$1;->val$input:Ljava/lang/CharSequence;

    invoke-direct {v0, v1, v2}, Lorg/nibor/autolink/LinkExtractor$LinkIterator;-><init>(Lorg/nibor/autolink/LinkExtractor;Ljava/lang/CharSequence;)V

    return-object v0
.end method
