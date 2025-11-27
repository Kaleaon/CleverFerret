.class public interface abstract Lcom/vladsch/flexmark/util/options/MessageProvider;
.super Ljava/lang/Object;
.source "MessageProvider.java"


# static fields
.field public static final DEFAULT:Lcom/vladsch/flexmark/util/options/MessageProvider;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 6
    new-instance v0, Lcom/vladsch/flexmark/util/options/MessageProvider$1;

    invoke-direct {v0}, Lcom/vladsch/flexmark/util/options/MessageProvider$1;-><init>()V

    sput-object v0, Lcom/vladsch/flexmark/util/options/MessageProvider;->DEFAULT:Lcom/vladsch/flexmark/util/options/MessageProvider;

    return-void
.end method


# virtual methods
.method public varargs abstract message(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;
.end method
