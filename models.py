from sqlalchemy import Column, Integer, String, ForeignKey, DateTime, Text
from sqlalchemy.orm import relationship
from sqlalchemy.sql import func
from database import Base


class Language(Base):
    __tablename__ = "languages"

    id = Column(Integer, primary_key=True, index=True)
    name = Column(String, nullable=False)
    story = Column(Text, nullable=True)

    translations = relationship("Translation", back_populates="language")


class Phrase(Base):
    __tablename__ = "phrases"

    id = Column(Integer, primary_key=True, index=True)
    phrase = Column(String, nullable=False)

    translations = relationship("Translation", back_populates="phrase")


class Translation(Base):
    __tablename__ = "translations"

    id = Column(Integer, primary_key=True, index=True)
    phrase_id = Column(Integer, ForeignKey("phrases.id"), nullable=False)
    language_id = Column(Integer, ForeignKey("languages.id"), nullable=False)
    user_id = Column(Integer, ForeignKey("users.id"), nullable=False)
    trans = Column(String, nullable=False)
    created_at = Column(DateTime, default=func.now(), nullable=False)
    updated_at = Column(DateTime, default=None, nullable=True)

    phrase = relationship("Phrase", back_populates="translations")
    language = relationship("Language", back_populates="translations")
    user = relationship("User", back_populates="translations")
    flags = relationship("Flag", back_populates="translation")


class User(Base):
    __tablename__ = "users"

    id = Column(Integer, primary_key=True, index=True)
    email = Column(String, unique=True, nullable=False)
    pword = Column(String, nullable=False)

    translations = relationship("Translation", back_populates="user")
    flags = relationship("Flag", back_populates="user")


class Flag(Base):
    __tablename__ = "flags"

    id = Column(Integer, primary_key=True, index=True)
    translation_id = Column(Integer, ForeignKey("translations.id"), nullable=False)
    user_id = Column(Integer, ForeignKey("users.id"), nullable=False)
    flag = Column(String, nullable=False)
    comment = Column(Text, nullable=True)
    created_at = Column(DateTime, default=func.now(), nullable=False)
    updated_at = Column(DateTime, default=None, nullable=True)

    translation = relationship("Translation", back_populates="flags")
    user = relationship("User", back_populates="flags")
