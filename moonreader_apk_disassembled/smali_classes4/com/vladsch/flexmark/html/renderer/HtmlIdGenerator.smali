.class public interface abstract Lcom/vladsch/flexmark/html/renderer/HtmlIdGenerator;
.super Ljava/lang/Object;
.source "HtmlIdGenerator.java"


# static fields
.field public static final NULL:Lcom/vladsch/flexmark/html/renderer/HtmlIdGenerator;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 7
    new-instance v0, Lcom/vladsch/flexmark/html/renderer/HtmlIdGenerator$1;

    invoke-direct {v0}, Lcom/vladsch/flexmark/html/renderer/HtmlIdGenerator$1;-><init>()V

    sput-object v0, Lcom/vladsch/flexmark/html/renderer/HtmlIdGenerator;->NULL:Lcom/vladsch/flexmark/html/renderer/HtmlIdGenerator;

    return-void
.end method


# virtual methods
.method public abstract generateIds(Lcom/vladsch/flexmark/util/ast/Document;)V
.end method

.method public abstract getId(Lcom/vladsch/flexmark/util/ast/Node;)Ljava/lang/String;
.end method

.method public abstract getId(Ljava/lang/CharSequence;)Ljava/lang/String;
.end method
